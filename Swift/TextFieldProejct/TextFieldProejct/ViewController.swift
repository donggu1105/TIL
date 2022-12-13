//
//  ViewController.swift
//  TextFieldProejct
//
//  Created by web_dev on 2022/12/13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        setUp()
        
            
    }
    
    func setUp() {
        
        view.backgroundColor = UIColor.gray
        textField.backgroundColor = .white
        textField.keyboardType = UIKeyboardType.numberPad
        textField.placeholder = "전화번호 입력"
        textField.textColor = .black
        textField.borderStyle = .line
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
    }
    
    // 텍스트필드의 입력을 시작할때 호출 (시작할지 말지 여부 )
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드의 입력이 시작됬다면
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("start editing")
    }
    
    // 텍스트필드 지우기 가능 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    // 텍스트 필드 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 됨
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(string)
        return true
    }


    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    
    
}

