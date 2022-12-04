//
//  ViewController.swift
//  UpDownGame1
//
//  Created by 강동현 on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    var comNumber = Int.random(in: 1...10)
    var myNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
            
        
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        
        guard let numString = sender.currentTitle else {return}
        
        numberLabel.text = numString
        
        guard let num = Int(numString) else {return}
        myNumber = num
        
        
    
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        comNumber = Int.random(in: 1...10)
    }
    
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        if (comNumber > myNumber) {
            
            mainLabel.text = "UP"
        } else if (comNumber < myNumber) {
            mainLabel.text = "DOWN"
            
        } else {
            mainLabel.text = "BINGO"
            
        }

        
    }
    
}

