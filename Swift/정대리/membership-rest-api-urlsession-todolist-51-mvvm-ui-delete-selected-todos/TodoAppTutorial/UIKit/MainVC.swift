//
//  MainVC.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/09.
//

import Foundation
import UIKit
import SwiftUI
import RxSwift
import RxCocoa
import RxRelay


class MainVC: UIViewController{
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var pageInfoLabel: UILabel!
    
    @IBOutlet weak var showAddTodoAlertBtn: UIButton!
    
    @IBOutlet weak var selectedTodosInfoLabel: UILabel!
    
    @IBOutlet weak var deleteSelectedTodosBtn: UIButton!
    
    var todos : [Todo] = []
    
    var todosVM: TodosVM_Rx = TodosVM_Rx()
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // 바텀 인디케이터뷰
    lazy var bottomIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = UIColor.systemBlue
        indicator.startAnimating()
        indicator.frame = CGRect(x: 0, y: 0, width: myTableView.bounds.width, height: 44)
        return indicator
    }()
    
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
//        refreshControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        refreshControl.tintColor = .systemBlue.withAlphaComponent(0.5)
//        refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    // 검색결과를 찾지 못했다 뷰
    lazy var searchDataNotFoundView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0,
                                        width: myTableView.bounds.width,
                                        height: 300))
        let label = UILabel()
        label.text = "검색결과를 찾을 수 없습니다 🗑️"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    // 가져올 데이터가 없다 뷰
    lazy var bottomNoMoreDataView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0,
                                        width: myTableView.bounds.width,
                                        height: 60))
        let label = UILabel()
        label.text = "더 이상 가져올 데이터가 없습니다... 🐶"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    var searchTermInputWorkItem : DispatchWorkItem? = nil
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        self.view.backgroundColor = .systemYellow
        
        // 버튼 액션 설정
        self.showAddTodoAlertBtn.addTarget(self, action: #selector(showAddTodoAlert), for: .touchUpInside)
        
        self.deleteSelectedTodosBtn.addTarget(self, action: #selector(onDeleteSelectedTodosBtnClicked(_:)), for: .touchUpInside)
        
        // ===
        
        // 테이블뷰 설정
        self.myTableView.register(TodoCell.uinib, forCellReuseIdentifier: TodoCell.reuseIdentifier)
//        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        
        self.myTableView.refreshControl = refreshControl
        self.myTableView.tableFooterView = bottomIndicator
        
        // ===
        
        // 서치바 설정
        self.searchBar.searchTextField.addTarget(self, action: #selector(searchTermChanged(_:)), for: .editingChanged)
        
        // ===
        
        self.todosVM
            .todos
            .bind(to: self.myTableView.rx.items(cellIdentifier: TodoCell.reuseIdentifier,
                                                cellType: TodoCell.self)) { [weak self] index, cellData, cell in
                
                guard let self = self else {return}
                
            
                    // 데이터 쎌에 넣어주기
//                cell.updateUI(cellData, self.todosVM.selectedTodoIds)
            
                cell.onSelectedActionEvent = self.onSelectionItemAction(_:_:)
            
                cell.onEditActionEvent = self.onEditItemAction
            
                cell.onDeleteActionEvent = self.onDeleteItemAction(_:)
                
            }
                                                .disposed(by: disposeBag)
        
        
//        self.todosVM
//            .todos
//            .withUnretained(self)
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { mainVC, updatedTodos in
//                mainVC.todos = updatedTodos
//                mainVC.myTableView.reloadData()
//            })
//            .disposed(by: disposeBag)
        
        // 뷰모델 이벤트 받기 - 뷰 - 뷰모델 바인딩 - 묶기
//        self.todosVM.notifyTodosChanged = {  [weak self]  updatedTodos in
//            guard let self = self else { return }
//            self.todos = updatedTodos
//            DispatchQueue.main.async {
//                self.myTableView.reloadData()
//            }
//        }
        
        
        self.todosVM
            .currentPageInfo
            .observe(on: MainScheduler.instance)
            .bind(to: self.pageInfoLabel.rx.text)
            .disposed(by: disposeBag)
            
        // 페이지 변경
//        self.todosVM.notifyCurrentPageChanged = { [weak self] currentPage in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                self.pageInfoLabel.text = "페이지 : \(currentPage)"
//            }
//        }
        
        // 로딩중 여부
        self.todosVM.notifyLoadingStateChanged = { [weak self] isLoading in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.myTableView.tableFooterView = isLoading ? self.bottomIndicator : nil
            }
        }
        
        // 당겨서 새로고침 완료
        self.todosVM.notifyRefreshEnded = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
        
        // 검색결과 없음 여부
        self.todosVM.notifySearchDataNotFound = { [weak self] notFound in
            guard let self = self else { return }
            print(#fileID, #function, #line, "- notFound: \(notFound)")
            DispatchQueue.main.async {
                self.myTableView.backgroundView = notFound ? self.searchDataNotFoundView : nil
            }
        }
        
        self.todosVM
            .notifyHasNextPage
            .observe(on: MainScheduler.instance)
            .map { !$0 ? self.bottomNoMoreDataView : nil }
            .bind(to: self.myTableView.rx.tableFooterView)
            .disposed(by: disposeBag)
        
        
        // 다음페이지 존재 여부
//        self.todosVM.notifyHasNextPage = { [weak self] hasNext in
//            guard let self = self else { return }
//            print(#fileID, #function, #line, "- hasNext: \(hasNext)")
//            DispatchQueue.main.async {
//                self.myTableView.tableFooterView = !hasNext ? self.bottomNoMoreDataView : nil
//            }
//        }
        
        // 할일 추가완료
        self.todosVM.notifyTodoAdded = { [weak self] in
            guard let self = self else { return }
            print(#fileID, #function, #line, "")
            DispatchQueue.main.async {
                self.myTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }
        
        // 에러 발생시 
        self.todosVM.notifyErrorOccured = { [weak self] errMsg in
            guard let self = self else { return }
            print(#fileID, #function, #line, "")
            DispatchQueue.main.async {
                self.showErrAlert(errMsg: errMsg)
            }
        }
        
        self.todosVM.notifySelectedTodoIdsChanged = { [weak self] selectedTodoIds in
            guard let self = self else { return }
            print(#fileID, #function, #line, "")
            DispatchQueue.main.async {
                
                let idsInfoString = selectedTodoIds.map{ "\($0)" }.joined(separator: ", ")
                
                self.selectedTodosInfoLabel.text = "선택된 할일들 : [" + idsInfoString + "]"
            }
            
        }
        
        // ===
        
    }// viewDidLoad
    
    
}

//MARK: - 얼럿
extension MainVC {
    
    /// 할일 삭제 얼럿 띄우기
    @objc fileprivate func showDeleteTodoAlert(_ id: Int){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "할일 삭제", message: "id:\(id) 할일을 삭제하시겠습니까?", preferredStyle: .alert)

        let submitAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            // 뷰모델 -> 해당 할일 삭제
            self.todosVM.deleteATodo(id)
        })
        
        let closeAction = UIAlertAction(title: "닫기", style: .cancel)
        
        alert.addAction(submitAction)
        
        alert.addAction(closeAction)
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    /// 에러 얼럿 띄우기
    @objc fileprivate func showErrAlert(errMsg: String){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "안내", message: errMsg, preferredStyle: .alert)

        let closeAction = UIAlertAction(title: "닫기", style: .cancel)
        
        alert.addAction(closeAction)
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    /// 할일 수정 얼럿 띄우기
    @objc fileprivate func showEditTodoAlert(_ id: Int, _ existingTitle: String){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "수정", message: "id: \(id)", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "예) 빡코딩하기"
            textField.text = existingTitle
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { [weak alert] (_) in
            if let userInput = alert?.textFields?[0].text {
                print("userInput: \(userInput)")
                self.todosVM.editATodo(id, userInput)
            }
        })
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive)
        
        alert.addAction(closeAction)
        alert.addAction(confirmAction)

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    /// 할일 추가 얼럿 띄우기
    @objc fileprivate func showAddTodoAlert(){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "추가", message: "할일을 입력해주세요", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "예) 빡코딩하기"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { [weak alert] (_) in
            if let userInput = alert?.textFields?[0].text {
                print("userInput: \(userInput)")
                self.todosVM.addATodo(userInput)
            }
        })
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive)
        
        alert.addAction(closeAction)
        alert.addAction(confirmAction)

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - 액션들
extension MainVC {
    
    @objc fileprivate func onDeleteSelectedTodosBtnClicked(_ sender: UIButton){
        print(#fileID, #function, #line, "- ")
        self.todosVM.deleteSeletedTodos()
    }
    
    /// 검색어가 입력되었다
    /// - Parameter sender:
    @objc fileprivate func searchTermChanged(_ sender: UITextField){
        print(#fileID, #function, #line, "- sender: \(String(describing: sender.text))")
        
        // 검색어가 입력되면 기존 작업 취소
        searchTermInputWorkItem?.cancel()
        
        let dispatchWorkItem = DispatchWorkItem(block: {
            // 백그라운드 - 사용자 입력 userInteractive
            DispatchQueue.global(qos: .userInteractive).async {
                DispatchQueue.main.async { [weak self] in
                    guard let userInput = sender.text,
                          let self = self else { return }
                    
                    print(#fileID, #function, #line, "- 검색 API 호출하기 userInput: \(userInput)")
                    self.todosVM.todos.accept([])
                    // 뷰모델 검색어 갱신
                    self.todosVM.searchTerm = userInput
                }
            }
        })
        
        // 기존작업을 나중에 취소하기 위해 메모리 주소 일치 시켜줌
        self.searchTermInputWorkItem = dispatchWorkItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: dispatchWorkItem)
    }
    
    /// 리프레시 처리
    /// - Parameter sender:
    @objc fileprivate func handleRefresh(_ sender: UIRefreshControl) {
        print(#fileID, #function, #line, "- ")
        
        // 뷰모델한테 시키기
        self.todosVM.fetchRefresh()
    }
    
    
    
    /// 쎌의 삭제 버튼 클릭시
    /// - Parameter id: <#id description#>
    fileprivate func onDeleteItemAction(_ id: Int) {
        print(#fileID, #function, #line, "- id: \(id)")
        self.showDeleteTodoAlert(id)
    }
    
    /// 쎌의 수정 버튼 클릭시
    /// - Parameters:
    ///   - id: 아이디
    ///   - editedTitle: 변경된 타이틀
    fileprivate func onEditItemAction(_ id: Int, _ editedTitle: String) {
        print(#fileID, #function, #line, "- id: \(id), editedTitle: \(editedTitle)")
        self.showEditTodoAlert(id, editedTitle)
    }
    
    /// 쎌의 아이템 선택 이벤트
    /// - Parameters:
    ///   - id: 아이디
    ///   - isOn: 선택여부
    fileprivate func onSelectionItemAction(_ id: Int, _ isOn: Bool) {
        print(#fileID, #function, #line, "- id: \(id), isOn: \(isOn)")
        #warning("TODO : - 선택된 요소 변경하라고 뷰모델 한테 알리기")
        self.todosVM.handleTodoSelection(id, isOn: isOn)
    }
}

extension MainVC : UITableViewDelegate {
    
    //
    /// - Parameter scrollView:
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(#fileID, #function, #line, "- ")
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYOffset

        if distanceFromBottom - 200 < height {
            print("바닥이다")
            self.todosVM.fetchMore()
        }
    }
    
    
}

// 1. 갯수
// 2. 어떤 쎌
//extension MainVC : UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todos.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as? TodoCell else {
//            return UITableViewCell()
//        }
//
//        let cellData = self.todos[indexPath.row]
//
//
//
//        // 데이터 쎌에 넣어주기
//        cell.updateUI(cellData, self.todosVM.selectedTodoIds)
//
//        cell.onSelectedActionEvent = onSelectionItemAction(_:_:)
//
//        cell.onEditActionEvent = onEditItemAction
//
//        cell.onDeleteActionEvent = onDeleteItemAction(_:)
//
//
//        return cell
//
//    }
//}

extension MainVC {
    
    private struct VCRepresentable : UIViewControllerRepresentable {
        
        let mainVC : MainVC
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return mainVC
        }
    }
    
    func getRepresentable() -> some View {
        VCRepresentable(mainVC: self)
    }
}




