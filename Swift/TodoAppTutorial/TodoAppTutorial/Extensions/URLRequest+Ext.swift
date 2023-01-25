//
//  URLRequest+Ext.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/25.
//

import UIKit


extension URLRequest {
  
  private func percentEscapeString(_ string: String) -> String {
    var characterSet = CharacterSet.alphanumerics
    characterSet.insert(charactersIn: "-._* ")
    
    return string
      .addingPercentEncoding(withAllowedCharacters: characterSet)!
      .replacingOccurrences(of: " ", with: "+")
      .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
  }
  
  mutating func percentEncodeParameters(parameters: [String : String]) {
    
      let parameterArray: [String] = parameters.map { (arg) -> String in
      let (key, value) = arg
      return "\(key)=\(self.percentEscapeString(value))"
    }
    
    httpBody = parameterArray.joined(separator: "&").data(using: String.Encoding.utf8)
  }
}
