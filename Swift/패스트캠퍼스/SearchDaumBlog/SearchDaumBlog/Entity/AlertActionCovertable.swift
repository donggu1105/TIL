//
//  AlertActionCovertable.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import UIKit

protocol AlertActionConvertable {
    
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
