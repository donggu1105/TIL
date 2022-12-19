//
//  SecondViewController.swift
//  BMI
//
//  Created by web_dev on 2022/12/16.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var bmiNumberLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    
    func makeUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        
        guard let bmi = bmiNumber else {return}
        bmiNumberLabel.text = String(bmi)
        
        adviceLabel.text = adviceString
        bmiNumberLabel.backgroundColor = bmiColor

    }
    
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    


}
