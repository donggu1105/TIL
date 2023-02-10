//
//  TodosVM.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/20.
//

import Foundation
import RxRelay
import RxCocoa
import RxSwift

class TodosVM_Rx {
    
    // 가공된 최종 데이터
    var todos : BehaviorRelay<[Todo]> = BehaviorRelay<[Todo]>(value: [])
    
    // 선택된 할일들
    var selectedTodoIds: Set<Int> = [] {
        didSet {
            print(#fileID, #function, #line, "- selectedTodoIds: \(selectedTodoIds)")
            self.notifySelectedTodoIdsChanged?(Array(selectedTodoIds))
        }
    }
    
    
    /// 검색어
    var searchTerm: String = "" {
        didSet {
            print(#fileID, #function, #line, "- searchTerm: \(searchTerm)")
            if searchTerm.count > 0 {
                self.searchTodos(searchTerm: searchTerm)
            } else {
                self.fetchTodos()
            }
        }
    }
    
    var pageInfo: BehaviorRelay<Meta?> = BehaviorRelay<Meta?>(value: nil)
    
    var notifyHasNextPage: Observable<Bool>
//    var pageInfo : Meta? = nil {
//        didSet {
//            print(#fileID, #function, #line, "- pageInfo: \(pageInfo)")
//
//            // 다음페이지 있는지 여부 이벤트
//            self.notifyHasNextPage?(pageInfo?.hasNext() ?? true)
//
//            // 현재 페이지 변경 이벤트
//            self.notifyCurrentPageChanged?(currentPage)
//        }
//    }
    
    var currentPage: BehaviorRelay<Int> = BehaviorRelay<Int>(value: 1)
    
    var currentPageInfo: Observable<String>
    
//    var currentPage: Int {
//        get {
//            if let pageInfo = self.pageInfo.value,
//               let currentPage = pageInfo.currentPage {
//                return currentPage
//            } else {
//                return 1
//            }
//        }
//    }
    
    var isLoading : Bool = false {
        didSet {
            print(#fileID, #function, #line, "- ")
            notifyLoadingStateChanged?(isLoading)
        }
    }
    
    var disposeBag = DisposeBag()
    
    //  선택된 할일들 변경 이벤트
    var notifySelectedTodoIdsChanged : ((_ selectedIds: [Int]) -> Void)? = nil
    
    //  에러발생 이벤트
    var notifyErrorOccured : ((_ errMsg: String) -> Void)? = nil
    
    //  할일 추가완료 이벤트
    var notifyTodoAdded : (() -> Void)? = nil
    
    // 다음페이지 있는지  이벤트
//    var notifyHasNextPage : ((_ hasNext: Bool) -> Void)? = nil
    
    // 검색결과 없음 여부 이벤트
    var notifySearchDataNotFound : ((_ noContent: Bool) -> Void)? = nil
    
    // 리프레시 완료 이벤트
    var notifyRefreshEnded : (() -> Void)? = nil
    
    // 로딩중 여부 변경 이벤트
    var notifyLoadingStateChanged : ((_ isLoading: Bool) -> Void)? = nil
    
    // 현재페이지 변경 이벤트
//    var notifyCurrentPageChanged : ((Int) -> Void)? = nil
    
    
    
    init(){
        print(#fileID, #function, #line, "- ")
        
        currentPageInfo = self.currentPage.map {"페이지: \($0)"}
        
        pageInfo.compactMap {$0}
            .map {
                   if let currentPage = $0.currentPage {
                    return currentPage
                } else {
                    return 1
                }
            }
            .bind(onNext: self.currentPage.accept(_:))
            .disposed(by: disposeBag)
        
        // 다음페이지 있는지 여부 이벤트
        self.notifyHasNextPage = pageInfo.skip(1).map { $0?.hasNext() ?? true }
        
        fetchTodos()
    }// init
    
    
    /// 선택된 할일 처리
    /// - Parameters:
    ///   - selectedTodoId:
    ///   - isOn:
    func handleTodoSelection(_ selectedTodoId: Int, isOn: Bool){
        if isOn {
            self.selectedTodoIds.insert(selectedTodoId)
        } else {
            self.selectedTodoIds.remove(selectedTodoId)
        }
    }
    
    
    /// 할일 검색하기
    /// - Parameters:
    ///   - searchTerm: 검색어
    ///   - page: 페이지
    func searchTodos(searchTerm: String, page: Int = 1){
        print(#fileID, #function, #line, "- <#comment#>")
        
        if searchTerm.count < 1 {
            print("검색어가 없습니다")
            return
        }
        
        if isLoading {
            print("로딩중입니다...")
            return
        }
        
        guard pageInfo.value?.hasNext() ?? true else {
            return print("다음페이지 없음")
        }
        
        self.notifySearchDataNotFound?(false)
        
        if page == 1 {
            self.todos.accept([])
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            // 서비스 로직
            TodosAPI.searchTodos(searchTerm: searchTerm,
                                 page: page,
                                 completion: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.isLoading = false
                    // 페이지 갱신
                    if let fetchedTodos : [Todo] = response.data,
                       let pageInfo : Meta = response.meta{
                        if page == 1 {
                            self.todos.accept(fetchedTodos)
                        } else {
                            let addedTodos = self.todos.value + fetchedTodos
                            
                            self.todos.accept(addedTodos)
                            
                        }
                        self.pageInfo.accept(pageInfo)
                    }
                case .failure(let failure):
                    print("failure: \(failure)")
                    self.isLoading = false
                    self.handleError(failure)
                }
                self.notifyRefreshEnded?()
                
            })
        })
    }
    
    /// 데이터 리프레시
    func fetchRefresh(){
        print(#fileID, #function, #line, "- ")
        self.fetchTodos(page: 1)
    }
    
    
    /// 더 가져오기
    func fetchMore(){
        print(#fileID, #function, #line, "- ")
        
        guard let pageInfo = self.pageInfo.value,
              pageInfo.hasNext(),
              !isLoading else {
            return print("다음페이지가 없다")
        }
        
        if searchTerm.count > 0 { // 검색어가 있으면
            self.searchTodos(searchTerm: searchTerm, page: self.currentPage.value + 1)
        } else {
            self.fetchTodos(page: currentPage.value + 1)
        }
    }
    
    /// 선택된 할일들 삭제
    func deleteSeletedTodos() {
        print(#fileID, #function, #line, "- ")
        
        if self.selectedTodoIds.count < 1 {
            notifyErrorOccured?("선택된 할일들이 없습니다")
            return
        }
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.deleteSelectedTodos(selectedTodoIds: Array(self.selectedTodoIds),
                                     completion: { [weak self] deletedTodoIds in
            guard let self = self else { return }
            
            // 삭제된 아이템 찾아서 그 녀석만 현재 리스트에서 빼기
            let filteredTodos = self.todos.value.filter{ !deletedTodoIds.contains($0.id ?? 0) }
            
            self.todos.accept(filteredTodos)
            
            self.selectedTodoIds = self.selectedTodoIds.filter{ !deletedTodoIds.contains($0) }
            
            self.isLoading = false
        })

    }
    
    /// 단일 할일 삭제
    /// - Parameter id: 할일 아이디
    func deleteATodo(_ id: Int) {
        print(#fileID, #function, #line, "- id: \(id)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.deleteATodo(id: id, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let deletedTodo : Todo = response.data,
                   let deletedTodoId : Int = deletedTodo.id{
                    
                    // 삭제된 아이템 찾아서 그 녀석만 현재 리스트에서 빼기
                    let filteredTodos = self.todos.value.filter{ $0.id ?? 0 != deletedTodoId
                    }
                    
                    self.todos.accept(filteredTodos)

                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
    }
    
    /// 할일추가
    /// - Parameter title: 할일 타이틀
    func addATodo(_ title: String) {
        print(#fileID, #function, #line, "- title: \(title)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.addATodoAndFetchTodos(title: title, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let fetchedTodos : [Todo] = response.data,
                   let pageInfo : Meta = response.meta{
                    self.todos.accept(fetchedTodos)
                    self.pageInfo.accept(pageInfo)
                    self.notifyTodoAdded?()
                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
    }
    
    /// 할일 수정
    /// - Parameter title: 할일 타이틀
    func editATodo(_ id: Int, _ editedTitle: String) {
        print(#fileID, #function, #line, "- id: \(id), editedTitle: \(editedTitle)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.editTodo(id: id,
                          title: editedTitle,
                          completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let editedTodo : Todo = response.data,
                   let editedTodoId : Int = editedTodo.id,
                   let editedIndex = self.todos.value.firstIndex(where: { $0.id ?? 0 == editedTodoId }) {
                    
                    
                    // 지금 수정한 녀석 아이디를 가지고 있는 인덱스 찾기
                    // 그 녀석을 바꾸기
                    var currentTodos = self.todos.value
                    currentTodos[editedIndex] = editedTodo
                    
                    self.todos.accept(currentTodos)
                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
  
    }
    
    /// 할일 가져오기
    /// - Parameter page: 페이지
    func fetchTodos(page: Int = 1){
        print(#fileID, #function, #line, "- <#comment#>")
        
        if isLoading {
            print("로딩중입니다...")
            return
        }
        
        isLoading = true
        
        Observable.just(())
            .delay(RxTimeInterval.milliseconds(700), scheduler: MainScheduler.instance)
            .flatMapLatest {
                TodosAPI
                    .fetchTodosWithObservable(page: page)
            }
            .do(onError: { error in
                self.handleError(error)
                self.pageInfo.accept(nil)
            },onCompleted: {
                self.isLoading = false
                self.notifyRefreshEnded?()

            })
            .compactMap { // Optional+Ext 로 언래핑 참고
                Optional(tuple: ($0.meta, $0.data))
            }
            .subscribe(onNext: { pageInfo, fetchedTodos in
                // 페이지 갱신
                    if page == 1 {
                        self.todos.accept(fetchedTodos)
                    } else {
                        let addedTodos = self.todos.value + fetchedTodos
                        self.todos.accept(addedTodos)
                    }
                self.pageInfo.accept(pageInfo)
            })
                .disposed(by: disposeBag)
        

    }
    
    
    /// API 에러처리
    /// - Parameter err: API 에러
    fileprivate func handleError(_ err: Error) {
        
        guard let apiError = err as? TodosAPI.ApiError else {
            print("모르는 에러입니다")
            return
        }
        print("handleError : err : \(apiError.info)")
        
        switch apiError {
        case .noContent:
            print("컨텐츠 없음")
            self.notifySearchDataNotFound?(true)
        case .unauthorized:
            print("인증안됨")
        case .decodingError:
            print("디코딩 에러입니당ㅇㅇ")
        case .errResponseFromServer:
            print("서버에서 온 에러입니다 : \(apiError.info)")
            self.notifyErrorOccured?(apiError.info)
        default:
            print("default")
        }
    }// handleError
    
}
