//
//  MainModel.swift
//  UploadUsedGoods
//
//  Created by Bo-Young PARK on 2021/09/09.
//

import Foundation

struct MainModel {
    func setAlert(errorMessages: [String]) -> (title: String, message: String?) {
        let title = errorMessages.isEmpty ? "성공": "실패"
        let message = errorMessages.isEmpty ? nil : errorMessages.joined(separator: "\n")
        return (title: title, message: message)
    }
}
