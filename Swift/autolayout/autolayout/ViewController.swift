//
//  ViewController.swift
//  autolayout
//
//  Created by web_dev on 2023/01/05.
//

import UIKit

class ViewController: UIViewController {
    
    let contentArray = [
    "1", "2", "3", "4", "5"
    
    ]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 셀 리소스 파일 가져오기
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        // 셀에 등록
        self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        setUp()
    }
    
    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }

    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

