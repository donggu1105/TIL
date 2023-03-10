//
//  UISearchBarWrapper.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/10.
//

import Foundation
import SwiftUI
import UIKit

struct UISearchBarWrapper: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeUIView(context: Context) -> some UIView {
        return UISearchBar()
    }
    
}
