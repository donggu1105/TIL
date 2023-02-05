//
//  TodosVM.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/20.
//

import Foundation


class TodosVM {
    
    // 가공된 최종 데이터
    var todos: [Todo] = [] {
        didSet {
            print(#fileID, #function, #line, "- ")
            self.notifyTodosChanged?(todos)
        }
    }
    
    // 데이터 변경 이벤트
    var notifyTodosChanged : (([Todo]) -> Void)? = nil
    // 현재페이지 변경 이벤트
    var notifyCurrentPageChange : ((Int) -> Void)? = nil
    // 로딩중 여부 변경 이벤트
    var notifyLoadingStateChanged : ((_ isLoading: Bool) -> Void)? = nil
    // 리프레시 완료 이벤트
    var notifyRefreshEnded : (() -> Void)? = nil
    
    var currentPage: Int = 1 {
        didSet {
            self.notifyCurrentPageChange?(currentPage)
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.notifyLoadingStateChanged?(isLoading)
        }
    }

    
    init(){
        print(#fileID, #function, #line, "- ")
        
        fetchTodos()
        
    }// init

    /// 할일 더 가져오기
    func fetchRefresh() {
        self.fetchTodos(page: 1)
    }
    
    
    /// 할일 더 가져오기
    func fetchMore() {
        self.fetchTodos(page: currentPage + 1)
    }
    
    /// 할일 가져오기
    /// - Parameter page: 페이지
    func fetchTodos(page: Int = 1) {
        
        if self.isLoading {
            print("로딩중입니다....")
            return
        }
        
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7 , execute: {
            TodosAPI.fetchTodos(page: page, completion: { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let response):
                    
                    self.currentPage = page
                    
                    if let fetchTodos: [Todo] = response.data {
                        if page == 1 {
                            self.todos = fetchTodos
                        } else {
                            self.todos.append(contentsOf: fetchTodos)
                        }
                    }
                case .failure(let failure):
                    print("failure : \(failure)")
                }
                self.notifyRefreshEnded?()
                self.isLoading = false
            })
        })
        
    }
    
    
    
    /// API 에러처리
    /// - Parameter err: API 에러
    fileprivate func handleError(_ err: Error) {
        
        if err is TodosAPI.ApiError {
            let apiError = err as! TodosAPI.ApiError
            
            print("handleError : err : \(apiError.info)")
            
            switch apiError {
            case .noContent:
                print("컨텐츠 없음")
            case .unauthorized:
                print("인증안됨")
            case .decodingError:
                print("디코딩 에러입니당ㅇㅇ")
            default:
                print("default")
            }
        }
        
    }// handleError
    
}
