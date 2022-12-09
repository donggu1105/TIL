//
//  FirstViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "FirstViewController"
       
        //mainLabel.text = someString
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .gray
        
        // 레이블 관련 설정
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(mainLabel)
        
        // 레이블 오토레이아웃
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 버튼 관련 설정
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
        // 버튼 오토레이아웃
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}
