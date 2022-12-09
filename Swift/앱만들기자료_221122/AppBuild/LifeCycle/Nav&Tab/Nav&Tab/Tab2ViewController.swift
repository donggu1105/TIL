//
//  Tab2ViewController.swift
//  Nav&Tab
//
//  Created by Allen H on 2022/01/10.
//

import UIKit

class Tab2ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        print("🎾Tab2: New VC-1 viewDidLoad 호출됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("🎾Tab2: New VC-1 viewWillAppear 호출됨")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("🎾Tab2: New VC-1 viewDidAppear 호출됨")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("🎾Tab2: New VC-1 viewWillDisappear 호출됨")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("🎾Tab2: New VC-1 viewDidDisappear 호출됨")
    }
    
    deinit {
        print("🎾Tab2: New VC-1 메모리에서 내려감")
    }

}
