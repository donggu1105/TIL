//
//  ViewController.swift
//  TodoApp
//
//  Created by web_dev on 2022/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let toDoManager = CoreDataManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupTableView()
    }
    
    func setupNaviBar() {
        title = "메모"
        
        // plus 버튼 달기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }

    @objc func plusButtonTapped() {
        print(#function)
        performSegue(withIdentifier: "ToDoCell", sender: nil)
    }
    
    
    func setupTableView() {
//        tableView.delegate = self
        tableView.dataSource = self
        
        // 선 없애기
        tableView.separatorStyle = .none
    }

}

extension ViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        
        let toDoData = toDoManager.getToDoListFromCoreData()
        cell.toDoData = toDoData[indexPath.row]
        
        // 셀위에 있는 버튼이 눌렸을때 (뷰컨트롤러에서) 어떤 행동을 하기 위해서 클로저 전달
        cell.updateButtonPressed = { [weak self] (senderCell) in
            // 뷰컨트롤러에 있는 세그웨이의 실행
            self?.performSegue(withIdentifier: "ToDoCell", sender: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoManager.getToDoListFromCoreData().count
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDoCell", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDoCell" {
            let detailVC = segue.destination as! DetailViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.toDoData = toDoManager.getToDoListFromCoreData()[indexPath.row]
        }
    }
    
}

