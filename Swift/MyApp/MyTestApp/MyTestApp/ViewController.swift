//
//  ViewController.swift
//  MyTestApp
//
//  Created by web_dev on 2022/12/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainLabel.backgroundColor = UIColor.yellow
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "test"
        
        mainLabel.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        mainLabel.textAlignment = NSTextAlignment.center
        
        
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
}

