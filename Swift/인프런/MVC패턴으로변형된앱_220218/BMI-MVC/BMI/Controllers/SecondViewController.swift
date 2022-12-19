//
//  SecondViewController.swift
//  BMI
//
//  Created by Allen H on 2021/12/12.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // 전화면에서 전달받은 BMI를 저장하기 위한 변수
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // 전화면에서 전달받은 BMI를 통해 셋팅
        bmiNumberLabel.text = "\(bmi!.value)"
        bmiNumberLabel.backgroundColor = bmi?.matchColor
        adviceLabel.text = bmi?.advice
        
        // UI셋팅
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8

        backButton.layer.cornerRadius = 5
    }
    
    // 다시 계산하기 버튼 눌렀을때
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // 전화면으로 돌아가는 메서드
        self.dismiss(animated: true, completion: nil)
    }
}
