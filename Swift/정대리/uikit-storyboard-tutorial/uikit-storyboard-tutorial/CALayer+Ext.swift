//
//  CALayer+Ext.swift
//  uikit-storyboard-tutorial
//
//  Created by web_dev on 2022/12/12.
//

import Foundation
import UIKit



extension CALayer {
    
    /// 뷰에 그림자 적용
    /// - Parameters:
    ///   - color: 그림자 색
    ///   - alpha: 투명도
    ///   - x: 가로위치
    ///   - y: 세로위치
    ///   - blur: 블러
    ///   - spread: 퍼짐정도
  func applyShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 20,
    blur: CGFloat = 35,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
