//
//  ViewController.swift
//  BMI
//
//  Created by web_dev on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager: BMICalculatorManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
    }

    func makeUI() {

        heightTextField.delegate = self
        weightTextField.delegate = self
        
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        
        
        bmiManager.calculateBMT(height: heightTextField.text!, weight: weightTextField.text!)
        
//        bmiManager.getBMIResult()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음화면으로 전달
            secondVC.bmiNumber = bmiManager.getBMIResult()
            secondVC.bmiColor = bmiManager.getBackgroundColor()
            secondVC.adviceString = bmiManager.getBMIAdviceString()
            
        }
        
        // 다음홤녀으로 가기전에 텍스트필드 지우기
        heightTextField.text = ""
        weightTextField.text = ""
        
    }

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "입력하셈"
            mainLabel.textColor = .red
            
            return false
        }
        
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
}


extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        
        return false
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        
        return false
    }
    
}
