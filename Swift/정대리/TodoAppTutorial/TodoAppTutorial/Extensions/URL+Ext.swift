//
//  URL+Ext.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/20.
//

import UIKit



extension URL {
    init?(baseUrl: String, queryItems: [String: String]) {
        guard var urlComponents = URLComponents(string: baseUrl) else { return nil }
        urlComponents.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let finalUrlString = urlComponents.url?.absoluteString else { return nil }
        self.init(string: finalUrlString)
    }
}
