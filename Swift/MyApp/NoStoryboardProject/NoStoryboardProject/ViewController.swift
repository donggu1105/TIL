//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by web_dev on 2022/12/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
//        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(yellowView)
                
        yellowView.snp.makeConstraints{ (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
            
        }
        
//    NSLayoutConstraint.activate([
//        yellowView.widthAnchor.constraint(equalToConstant: 100),
//        yellowView.heightAnchor.constraint(equalToConstant: 100),
//        yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//        yellowView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
//    ])
//
        
        
        
        
        
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



