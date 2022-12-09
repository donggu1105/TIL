//
//  ViewController.swift
//  VC-CyCle
//
//  Created by Allen H on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {

    // view(메인뷰)를 만들어 내는 시점/지점 (한번만 호출): 코드로 짤때 뷰 교체 가능 시점
    // 스토리보드로 이용할때, 호출하면 화면 로드 안됨 ⭐️
//    override func loadView() {
//        //super.loadView() // 재정의해서, 구현할때 상위호출 필요하지 않음(하면 안됨)
//        print("VC-1 loadView 호출됨")
//    }

    
    // 스토리보드 뷰와 연결된 후 (한번만 호출): 코드와 스토리보드의 뷰가 연결된 후
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC-1 viewDidLoad 호출됨")
    }

    // 뷰가 나타나기 전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC-1 viewWillAppear 호출됨")
    }

    // 뷰가 나타난 후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC-1 viewDidAppear 호출됨")
    }

    // 뷰가 사라지기 전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC-1 viewWillDisappear 호출됨")
    }

    // 뷰가 사라지기 전
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC-1 viewDidDisappear 호출됨")
    }
    
    deinit {
        print("VC-1 메모리에서 내려감")
    }

}

