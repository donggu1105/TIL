//
//  ViewController.swift
//  MemberList
//
//  Created by web_dev on 2022/12/20.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    
    var memberListManager = MemberListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setUpDatas()
        setUpTableView()
        setupNaviBar()
        setupTableViewConstrains()
        
    }
    
    func setUpDatas() {
        memberListManager.makeMembersListDatas()

    }
    

    func setupNaviBar() {
        
        title = "회원 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "MemberCell")
        
        tableView.rowHeight = 60
    }
    
    
    
    
    
    func setupTableViewConstrains() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! TableViewCell

        cell.member = memberListManager[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        
        
        let array = memberListManager.getMembersList()
        detailVC.member = array[indexPath.row]
        
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
