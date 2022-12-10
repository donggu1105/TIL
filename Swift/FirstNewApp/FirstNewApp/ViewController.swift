//
//  ViewController.swift
//  FirstNewApp
//
//  Created by web_dev on 2022/12/09.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?

    var number: Int = 0
    
    
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
        number = seconds
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _  in
            
            if number > 0 {
                number -= 1
                
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                timer?.invalidate()
                
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }

            
        }
    }
    
    
}

