//
//  ViewController.swift
//  ViewCycleCustomView
//
//  Created by Allen H on 2022/01/22.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var myButton: MyButton = {
        let button = MyButton()
        button.backgroundColor = .yellow
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleButtonAction), for:.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    // 뷰컨트롤러에서 프레임이 결정이 되는 곳 ⭐️
    // 그래서, 버튼을 넓이 기준으로 깍는 것이 가능(넓이 프레임이 결정되니까)
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.myButton.layer.cornerRadius = self.myButton.frame.width / 2
    }
    
    func setupUI() {
        view.addSubview(myButton)
    }
    
    func setupConstraints() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
    
        myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 높이를 넓이 기준으로 1:1로 설정하는 오토레이아웃 코드(multiplier)
        myButton.heightAnchor.constraint(equalTo: myButton.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func handleButtonAction(){
        print(#function)
    }
    
}

