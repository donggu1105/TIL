//
//  MyButton.swift
//  ViewCycleCustomView
//
//  Created by Allen H on 2022/01/22.
//

import UIKit

final class MyButton: UIButton {
    
    // 버튼(뷰) 내부에 오토레이아웃을 잡을 필요가 있다면 여기 구현
//    override func updateConstraints() {
//
//        // 구현시 여기에 구현 ⭐️
//
//        super.updateConstraints() // 나중에 호출 ⭐️
//    }
    
    // 현재 화면크기를 기준으로 프레임이 잡히는 곳(버튼 프레임이 결정)
    // 버튼을 넓이 기준으로 깍는 것이 가능(넓이 프레임이 결정되니까)
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = self.frame.width / 2
//
//    }
    
    // 내부 컨텐츠를 그리는 곳
    // (예를 들어, draw메서드 내에 코드로 구현해서 별모양을 그린다던지, 할 수 있음)
//    override func draw(_ rect: CGRect) {
//        <#code#>
//    }
    
}
