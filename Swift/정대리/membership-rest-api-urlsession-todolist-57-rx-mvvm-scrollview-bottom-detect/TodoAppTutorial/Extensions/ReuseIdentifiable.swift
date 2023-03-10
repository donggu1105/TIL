//
//  ReuseIdentifiable.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2023/01/16.
//

import Foundation
import UIKit

extension UITableViewCell : ReuseIdentifiable {}

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}


