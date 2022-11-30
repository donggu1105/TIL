//
//  main.swift
//  AccessControl
//
//  Created by Allen H on 2021/04/12.
//

import Foundation




/**=======================================
 - public으로 선언된 클래스
 =========================================**/
print("public으로 선언된 클래스==================")

let somePublic = SomePublicClass()
print(somePublic.someOpenProperty)
print(somePublic.somePublicProperty)
print(somePublic.someInternalProperty)
//print(somePublic.someFilePrivateProperty)    // 같은 파일이 아니기 때문에 접근 불가능 ⭐️
//print(somePublic.somePrivateProperty)




/**=======================================
 - internal로 선언된 클래스
 =========================================**/
print("internal로 선언된 클래스==================")

let someInternal = SomeInternalClass()
print(someInternal.someOpenProperty)
print(someInternal.somePublicProperty)
print(someInternal.someInternalProperty)
//print(someInternal.someFilePrivateProperty)            
//print(someInternal.somePrivateProperty)




/**=======================================
 - file-private으로 선언된 클래스
 =========================================**/
print("file-private으로 선언된 클래스==================")

// 아예 접근 불가 ⭐️
//fileprivate let someFilePrivate = SomeFilePrivateClass()


// 접근해서 사용하려면?
// 같은 파일내에 들어있는 다른 클래스에 접근해서 사용해야함
let controlClass = SomeFilePrivateControlClass()
controlClass.controlFunction()       // 이 내부에서 SomeFilePrivateClass에 접근




/**=======================================
 - private으로 선언된 클래스
 =========================================**/
print("private으로 선언된 클래스(file-private동작)============")

// 아예 접근 불가 ⭐️
//fileprivate let somePrivate = SomePrivateClass()


// 접근해서 사용하려면?
// 같은 파일내에 들어있는 다른 클래스에 접근해서 사용해야함
let privatecontrolClass = SomePrivateControlClass()
privatecontrolClass.controlFunction()       // 이 내부에서 SomePrivateClass에 접근


