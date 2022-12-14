//
//  ViewController.swift
//  Selector2
//
//  Created by Allen H on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    // 버튼 관련 속성(변수) 선언 (일단 인스턴스 생성해서 담기)
    let codeButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // 코드로 짜는 UI관련 함수
    func configureUI() {
        // 버튼 셋팅
        codeButton.setTitle("Code Button", for: .normal)
        codeButton.setTitleColor(.white, for: .normal)
        codeButton.backgroundColor = .blue
        // 자동 제약 잡아주는 것 취소 ===> 코드로 오토레이아웃 잡으려면 필수
        codeButton.translatesAutoresizingMaskIntoConstraints = false
        // 버튼 눌렀을때 실행시킬 함수 연결하기 ⭐️⭐️⭐️
        codeButton.addTarget(self, action: #selector(ViewController.codeButtonTapped), for: .touchUpInside)
        
        // 버튼을 화면에 올리기
        view.addSubview(codeButton)
        // 오토레이아웃 코드로 짜기 (지금 중요하지 않음)
        NSLayoutConstraint.activate([
            codeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            codeButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 30),
            codeButton.widthAnchor.constraint(equalToConstant: 200),
            codeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    // 스토리보드의 버튼이 눌렸을 때 실행되는 함수
    @IBAction func storyBoardButtonTapped(_ sender: UIButton) {
        print("스토리보드 버튼 눌림")
    }
    
    // 코드로 만든 버튼이 눌렸을 때 실행되는 함수
    @objc func codeButtonTapped() {
        print("코드 버튼 눌림")
    }


}

