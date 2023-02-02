//
//  ReuseIdentifiable.swift
//  TodoAppTutorial
//
//  Created by 강동현 on 2023/02/02.
//

import Foundation
import UIKit


extension UITableViewCell : Nibbed { }
extension UITableViewCell : ReuseIdentifiable {}

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}



