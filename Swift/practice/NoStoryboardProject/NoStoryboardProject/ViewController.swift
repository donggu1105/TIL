//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by web_dev on 2022/12/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var topStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        
        
        // 서브뷰 추가
        self.view.addSubview(topStackView)
        
        // 위치 잡기
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.
        
        ])
        
        
    }

}


#if DEBUG
import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
    }
}

#endif



