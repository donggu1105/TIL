//
//  ViewController.swift
//  Selector
//
//  Created by Allen H on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    // 버튼 관련 속성(변수) 선언 (방식: 클로저 실행문) ==> 버튼 초기화시, 클로저 한번 실행후 버튼 리턴
    let codeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Code Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        // 자동 제약 잡아주는 것 취소 ===> 코드로 오토레이아웃 잡으려면 필수
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 버튼 눌렀을때 실행시킬 함수 연결하기 ⭐️⭐️⭐️
        button.addTarget(self, action: #selector(ViewController.codeButtonTapped), for: .touchUpInside)
        //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return button  // 리턴해서, codeButton에 셋팅된 버튼을 담는 것
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드로 짜는 UI관련 함수 호출
        configureUI()
    }
    
    
    // 코드로 짜는 UI관련 함수
    func configureUI() {
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
        
        // 타이머 (어떤 일을 몇 초 뒤에 하고 싶을 때 사용하는 객체)
        //Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.after5Seconds), userInfo: nil, repeats: false)
     
        //Timer.scheduledTimer(timeInterval: <#T##TimeInterval#>, target: <#T##Any#>, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
        
    }

    @objc func after5Seconds() {
        print("코드 버튼 눌린 후, 5초 지나서 출력하기")
    }
    
}

