//
//  SomePublicClass.swift
//  AccessControl
//
//  Created by Allen H on 2021/04/12.
//

import Foundation

public class SomePublicClass {                  // 명시적인 public 선언
    open var someOpenProperty = "SomeOpen"      // public으로 동작 ⭐️
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"   // 원래의 기본 수준
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}
