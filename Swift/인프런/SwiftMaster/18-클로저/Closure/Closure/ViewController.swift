//
//  ViewController.swift
//  Closure
//
//  Created by Allen H on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {
 
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.3)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(tf)    // 뷰컨트롤러의 view에 접근 못함
        return tf
    }()
    
    // 아래 버튼2와 비교
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My Button", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    // 위의 버튼과 비교
    let button2 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // emailTextField를 뷰 컨트롤러의 view에 하위뷰로 더하기
        view.addSubview(emailTextField)
        setupUI()
        setupExampleButton2()
    }
    
    // 오토레이아웃을 코드로 잡기
    func setupUI() {
        // emailTextField 관련 오토레이아웃
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // button 관련 오토레이아웃
        button.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupExampleButton2() {
        // button2 관련 설정
        button2.setTitle("New Button", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button2.setTitleColor(.white, for: .normal)
        button2.backgroundColor = UIColor.blue
        button2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button2)

        // button2 관련 오토레이아웃
        button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    
    
}

