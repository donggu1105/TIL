//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Allen H on 2021/11/10.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    // 숫자(선택된 초)를 관리하기 위한 변수
    var number = 0
    // 타이머 객체를 담기 위한 변수
    var timer: Timer?
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // UI셋팅 함수
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    // 슬라이더 값이 바뀔때마다 호출되는 함수
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    // 스타트버튼을 누르면 실행하는 함수
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
    }
    
    
    
    // 다음 동작의 실행 함수
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            print(Float(number) / Float(60))
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            mainLabel.text = "초를 선택하세요"
            number = 0
            //print(number)
            timer?.invalidate()
            AudioServicesPlaySystemSound(SystemSoundID(1000))
        }
    }
    
    // 리셋버튼이 눌리면 실행되는 함수
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
    }
    
}

