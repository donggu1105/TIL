//
//  Optional+Ext.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2023/02/06.
//

import Foundation

//정대리 스위프트 기초문법 - 81일차 내용 참고
//https://spangle-wedelia-2dc.notion.site/Swift-Tip-of-the-day-c428bfd990674bcfa2a4973e5d08c4eb

//참고링크: https://stackoverflow.com/questions/27991378/swift-optional-binding-with-tuples

extension Optional {
    init<T, U>(tuple: (T?, U?)) where Wrapped == (T, U) {
        
        switch tuple{
            case (let t?, let u?):
            self = (t, u)
        default:
            self = nil
        }
    }
}
