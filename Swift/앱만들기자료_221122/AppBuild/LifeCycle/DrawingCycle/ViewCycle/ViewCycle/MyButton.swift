//
//  MyButton.swift
//  ViewCycle
//
//  Created by Allen H on 2022/01/20.
//

import UIKit

final class MyButton: UIButton {

    var onAndOff = false
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func toggle() {
        self.onAndOff.toggle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
    }
    
}
