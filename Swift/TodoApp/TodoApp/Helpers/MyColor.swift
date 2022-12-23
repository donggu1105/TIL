//
//  MyColor.swift
//  MyToDoApp
//
//  Created by Allen H on 2022/04/21.
//

import UIKit

enum MyColor: Int64 {
    case red    = 1
    case green  = 2
    case blue   = 3
    case purple = 4
    
    var backgoundColor: UIColor {
        switch self {
        case .red:
            //UIColor(hexString: "#EFD9D4")
            return UIColor(red: 239/255, green: 217/255, blue: 212/255, alpha: 1)
        case .green:
            //UIColor(hexString: "#C2EDEA")
            return UIColor(red: 194/255, green: 237/255, blue: 234/255, alpha: 1)
        case .blue:
            //UIColor(hexString: "#C4E4F2")
            return UIColor(red: 196/255, green: 228/255, blue: 242/255, alpha: 1)
        case .purple:
            //UIColor(hexString: "#D4D4F5")
            return UIColor(red: 212/255, green: 212/255, blue: 245/255, alpha: 1)
        }
    }
    
    var buttonColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 232/255, green: 163/255, blue: 153/255, alpha: 1)
        case .green:
            return UIColor(red: 89/255, green: 190/255, blue: 183/255, alpha: 1)
        case .blue:
            return UIColor(red: 88/255, green: 181/255, blue: 236/255, alpha: 1)
        case .purple:
            return UIColor(red: 118/255, green: 103/255, blue: 228/255, alpha: 1)
        }
    }
    
}
