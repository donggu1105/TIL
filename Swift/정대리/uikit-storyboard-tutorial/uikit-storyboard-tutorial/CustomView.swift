//
//  CustomView.swift
//  uikit-storyboard-tutorial
//
//  Created by web_dev on 2022/12/12.
//

import Foundation
import UIKit



@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var isCircle: Bool = false {
        didSet {
            if  isSquare() && isCircle {
                self.layer.cornerRadius = self.frame.width / 2
            }
        }
    }
    @IBInspectable
    var hasShadow: Bool = false {
        didSet {
            if  hasShadow {
                layer.applyShadow()
            }
        }
    }
    
    
    /// 뷰 정사각형 여부
    /// - Returns: 여부
    fileprivate func isSquare() -> Bool {
        return self.frame.width == self.frame.height
    }
    
    
    
    
}
