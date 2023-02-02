//
//  Storyboared.swift
//  TodoAppTutorial
//
//  Created by 강동현 on 2023/02/02.
//

import Foundation
import UIKit


extension UIViewController : StoryBoarded {}

protocol StoryBoarded {
    static func instantiate(_ storyboardName: String?) -> Self
}

extension StoryBoarded {
    
    static func instantiate(_ storyboardName: String? = nil) -> Self {
        
        let name = storyboardName ?? String(describing: self)
        
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
