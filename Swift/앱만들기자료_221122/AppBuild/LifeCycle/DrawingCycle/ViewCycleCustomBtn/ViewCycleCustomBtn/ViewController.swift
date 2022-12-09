//
//  ViewController.swift
//  ViewCycleCustomBtn
//
//  Created by Allen H on 2022/01/22.
//

import UIKit

final class ViewController: UIViewController {
    
    // 제약조건을 저장하기 위한 변수 선언
    // (나중에 접근해서 변경하기 위함)
    private var myViewHeightAnchor: NSLayoutConstraint!
    private var myViewWidthAnchor: NSLayoutConstraint!
    
    // 버튼
    private lazy var myView: MyView = {
        let button = MyView()
        button.layer.cornerRadius = 12
        button.backgroundColor = .yellow
        button.onAndOff = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(myView)
        myView.myButton.addTarget(self, action: #selector(handleAnimationEffect), for: .touchUpInside)
    }
    
    func setupConstraints() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        // 제약조건을 변수에 저장
        myViewHeightAnchor = myView.heightAnchor.constraint(equalToConstant: 120)
        myViewWidthAnchor = myView.widthAnchor.constraint(equalToConstant: 150)
        
        myViewHeightAnchor.isActive = true
        myViewWidthAnchor.isActive = true
        
        // 원칙적인 오토레이아웃 설정 (가운데 정렬 - X, Y축)
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handleAnimationEffect(){
        print(#function)
        
        // 높이/넓이 변경 관련 애니메이션 코드
        if !myView.onAndOff {
            myViewHeightAnchor.constant = 400
            myViewWidthAnchor.constant = 300
        } else {
            myViewHeightAnchor.constant = 120
            myViewWidthAnchor.constant = 150
        }
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        } completion: { success in
            print("애니메이션 처리 완료")
        }
        
        myView.toggle()
    }
    
}

