//
//  MainVC.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/09.
//

import Foundation
import UIKit
import SwiftUI


class MainVC: UIViewController{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var todosVM: TodosVM = TodosVM()
    
    var todos: [Todo] = []
    
    // 바텀 인디케이터뷰
    lazy var bottomIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = UIColor.systemBlue
        indicator.startAnimating()
        indicator.frame = CGRect(x: 0, y: 0, width: myTableView.bounds.width, height: 44)
        return indicator
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        // 위치 색상 변경
//        refreshControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
//        refreshControl.tintColor = .systemBlue
        refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        
        return refreshControl
        
    }()
    
    @IBOutlet weak var pageInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        self.view.backgroundColor = .systemYellow
        
        // 테이블뷰 설정
        self.myTableView.register(TodoCell.uinib, forCellReuseIdentifier: TodoCell.reuseIdentifier)
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.tableFooterView = bottomIndicator
        self.myTableView.refreshControl = refreshControl
        // ====
        
        
        // 뷰모델 이벤트 받기 - 뷰 <-> 뷰모델 바인딩
        self.todosVM.notifyTodosChanged = { [weak self] updatedTods in
            guard let self = self else {return}
            self.todos = updatedTods
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        // ===
        
        // 페이지 변경
        self.todosVM.notifyCurrentPageChange = { [weak self] currentPage in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.pageInfoLabel.text = "페이지 : \(currentPage)"
            }
        }
        
        
        self.todosVM.notifyLoadingStateChanged = { [weak self] isLoading in
            guard let self = self else {return}

            DispatchQueue.main.async {
                self.myTableView.tableFooterView = isLoading ? self.bottomIndicator : nil
            }
        }
        
        // 당겨서 새로고침 완료
        self.todosVM.notifyRefreshEnded = { [weak self] in
            guard let self = self else {return}

            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
        
    } // viewDidLoad
}

//MARK: - 액션들
extension MainVC {
    
    @objc fileprivate func handleRefresh(_ sender: UIRefreshControl) {
        print(#fileID, #function, #line, "- ")
        
        // 뷰모델한테 시키기
        self.todosVM.fetchRefresh()
        
    }
    
}
extension MainVC: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y // 떨어져있는 간격
        let distanceFromBottom = (scrollView.contentSize.height - 200) - contentYOffset // 바닥에서 떨어져있는 간격
        
        if distanceFromBottom < height {
            print("바닥")
            self.todosVM.fetchMore()
            
        }
    }
}

extension MainVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        
        let cellData = self.todos[indexPath.row]
        
        // 데이터 쎌에 넣어주기
        cell.updateUI(cellData)
        
        return cell
        
    }
}

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



