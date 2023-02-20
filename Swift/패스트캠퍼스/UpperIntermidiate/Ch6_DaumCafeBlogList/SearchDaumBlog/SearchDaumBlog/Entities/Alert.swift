//
//  Alert.swift
//  SearchDaumBlog
//
//  Created by Bo-Young PARK on 2021/09/09.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
