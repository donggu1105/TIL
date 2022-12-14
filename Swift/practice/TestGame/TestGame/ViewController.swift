//
//  ViewController.swift
//  TestGame
//
//  Created by 강동현 on 2022/12/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        comChoiceLabel.text = "ready"
        myChoiceLabel.text = "ready"

    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        let title = sender.currentTitle!
                
        switch title {
        case "가위": break
        case "바위": break
        case "보": break
        default: break
            
            
        }
        
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: Any) {
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    
}
