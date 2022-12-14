//
//  ViewController.swift
//  N&TFirstCode
//
//  Created by Allen H on 2022/01/10.
//

import UIKit

class FirstViewController: UIViewController {

    // 로그인 여부에 관련된 참/거짓 저장하는 속성
    var isLoggedIn = false
    
    //var navigationController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        makeUI()
        
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        // =====> viewDidAppear가 더 정확한 시점 (뷰가 뜬 다음으로 코드 옮기기) ⭐️⭐️⭐️
        
//        if !isLoggedIn {
//            let vc = LoginViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: false, completion: nil)
//        }

    }
    
    // 다음화면을 띄우는 더 정확한 시점 ⭐️⭐️⭐️
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
    }
    
    
    func makeUI() {
        view.backgroundColor = .gray
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        //appearance.backgroundColor = .brown     // 색상설정
        
        //appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
        
    }
    
    
    

}
