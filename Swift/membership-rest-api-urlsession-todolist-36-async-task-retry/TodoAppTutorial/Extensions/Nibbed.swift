//
//  Nibbed.swift
//  TodoAppTutorial
//
//  Created by 강동현 on 2023/02/02.
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

