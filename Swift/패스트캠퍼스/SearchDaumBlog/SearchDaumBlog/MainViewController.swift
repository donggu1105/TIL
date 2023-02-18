//
//  ViewController.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/19.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        attribute()
        layout()
    }

    
    private func bind() {
        
    }
    
    // 뷰 꾸미기
    private func attribute() {
        title = "다음 블로그 검색"
        view.backgroundColor = .white
    }
    
    private func layout() {
        
    }
    

}

