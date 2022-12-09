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
    
    // 전화면에서 전달받은 데이터들
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전화면에서 전달받은 데이터들을 통해 셋팅
        bmiNumberLabel.text = "\(bmiNumber!)"
        bmiNumberLabel.backgroundColor = bmiColor
        adviceLabel.text = adviceString
        
        configureUI()
    }
    
    // UI셋팅
    func configureUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        //bmiNumberLabel.backgroundColor = UIColor.brown

        backButton.layer.cornerRadius = 5
    }
    
    // 다시 계산하기 버튼 눌렀을때
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // 전화면으로 돌아가는 메서드
        self.dismiss(animated: true, completion: nil)
    }
    


}
