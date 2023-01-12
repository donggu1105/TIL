//
//  ViewController.swift
//  uikit-storyboard-gui-test
//
//  Created by 강동현 on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal // 스택뷰 방향
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .yellow
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "사운드\n테라피"
        titleLabel.numberOfLines = 2 // 0으로 하면 여러줄 가능
        

        // 서브타이틀 설정
        let subTitleLabel = UILabel()
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.text = "무료"
        
        let subtitleLabelBg = UIView()
        subtitleLabelBg.backgroundColor = .systemBlue
        subtitleLabelBg.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabelBg.addSubview(subTitleLabel)
        
        let bottomImageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up.circle.fill"))
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),
            bottomImageView.heightAnchor.constraint(equalToConstant: 50),
        
        ])
        
        firstView.addSubview(titleLabel)
        firstView.addSubview(subtitleLabelBg)
        firstView.addSubview(bottomImageView)
        
        NSLayoutConstraint.activate([
            
            
            subTitleLabel.centerXAnchor.constraint(equalTo: subtitleLabelBg.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: subtitleLabelBg.centerYAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: subtitleLabelBg.topAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelBg.leadingAnchor, constant: 5)
        ])
        
        
        NSLayoutConstraint.activate([
            
            firstView.heightAnchor.constraint(equalToConstant: 200),

            titleLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            subtitleLabelBg.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 5),
            subtitleLabelBg.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            bottomImageView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 20),
            bottomImageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 20)
        ])
        
        
        
        
        topStackView.addArrangedSubview(firstView)
        // 서브뷰 추가
        self.view.addSubview(topStackView)
        
        // 위치 잡기
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:20)
        ])
        
        
        
        
        
    }


}

