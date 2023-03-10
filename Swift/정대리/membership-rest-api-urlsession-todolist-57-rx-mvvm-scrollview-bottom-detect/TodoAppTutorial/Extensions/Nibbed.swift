//
//  Nibbed.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2023/01/16.
//

import Foundation
import UIKit

protocol Nibbed {
    static var uinib: UINib { get }
}

extension Nibbed {
    static var uinib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}

extension UITableViewCell : Nibbed { }
