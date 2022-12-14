//
//  LoginViewController.swift
//  N&TFirstCode
//
//  Created by Allen H on 2022/01/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    // 굳이 뷰를 따로 만들지 않았음 (MVC패턴으로 만들지 않았음)
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    // UI설정하는 코드, 버튼의 오토레이아웃
    func makeUI() {
        view.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    // 버튼 누르면 동작하는 코드 ===> 로그인하면, 디스미스 (탭바가 더 아래에 깔려있음)
    @objc func loginButtonTapped() {
        
        // 전화면의 isLoggedIn속성에 접근하기 ⭐️
//        if let presentingVC = presentingViewController { // 옵셔널 바인딩
//            let tabBarCon = presentingVC as! UITabBarController   // 탭바에 접근하기
//            let nav = tabBarCon.viewControllers?[0] as! UINavigationController  // 네비게이션바에 접근하기
//            let firstVC = nav.viewControllers[0] as! FirstViewController  // FirstVC에 접근하기
//            firstVC.isLoggedIn.toggle()  // 로그인 되었다고 상태 변화시키기 (실제 앱에서 이렇게 구현할 일은 없음)
//        }
        
        dismiss(animated: true, completion: nil)
    }
}
