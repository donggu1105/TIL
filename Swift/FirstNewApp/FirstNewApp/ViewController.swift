//
//  ViewController.swift
//  FirstNewApp
//
//  Created by web_dev on 2022/12/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
            

    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        // slider 가운데 설정
        slider.setValue(0.5, animated: true)
        slider.setThumbImage(UIImage(named: "icons8-thumbs-up-48"), for: .normal)
        

    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let seconds = Int(slider.value * 60)
        
        mainLabel.text = "\(seconds)초"
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
    
}

