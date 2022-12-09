//
//  ViewController.swift
//  FirstNewApp
//
//  Created by web_dev on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
            

    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"

    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
    
}

