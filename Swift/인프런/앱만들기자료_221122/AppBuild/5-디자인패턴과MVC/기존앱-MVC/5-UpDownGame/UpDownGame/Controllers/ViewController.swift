//
//  ViewController.swift
//  UpDownGame
//
//  Created by Allen H on 2021/05/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var upDownManager = UpDownManager()
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }
    
    func reset() {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        upDownManager.resetNum()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else { return }
        numberLabel.text = numString
        
        guard let num = Int(numString) else { return }
        upDownManager.setUsersNum(num: num)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let myNumString = numberLabel.text,
            let myNumber = Int(myNumString) else {
            return
        }
        
        upDownManager.setUsersNum(num: myNumber)
        mainLabel.text = upDownManager.getUpDownResult()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }

}


