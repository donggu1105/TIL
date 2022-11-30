import UIKit

/*:
 ## 메타타입(Metatype)
 * 메타타입의 개념에 대한 이해
 ---
 */
class Dog {
    static let species = "Dog"
    var name: String = ""
    var weight: Double = 0.0
}


       // ⬇︎ 붕어빵의 타입
let dog1: Dog = Dog()
               // ⬆︎ 붕어빵

dog1.name = "초코"
dog1.weight = 10.0



let dog2: Dog = Dog()
dog2.name = "보리"
dog2.weight = 15.0



//:> 메타 타입은 타입(인스턴스)(붕어빵틀의 메모리)의 타입임
      // ⬇︎ 붕어빵틀의 타입
let dog: Dog.Type = Dog.self
                    // ⬆︎ 붕어빵틀

let dogSelf: Dog.Type = type(of: dog1)    // 붕어빵틀


Dog.species     // "Dog"
Dog.self.species    // "Dog"




class Person {
    static let species = "인간"
    var name: String = ""
}


// 인스턴스의 타입과 인스턴스
let person1: Person = Person()
person1.name = "홍길동"


// 인스턴스의 타입과 인스턴스
let person2: Person = Person()
person2.name = "임꺽정"



//:> 메타타입의 이해
// 붕어빵틀의 타입   // 붕어빵틀의 메모리
let pSelf1: Person.Type = Person.self
let pSelf2: Person.Type = type(of: person1)   // 타입의 타입 (붕어빵틀형식으로 메모리에 있어)



pSelf1.species  // "인간"
pSelf2.species  // "인간"
Person.species  // "인간"
Person.self.species // "인간"




var num1: Int = 5  // 붕어빵
var num2: Int = 7


// (타입자체의) 타입속성
Int.max
Int.self.max

Int.zero
Int.self.zero



var numberSelf: Int.Type = Int.self




type(of: person1)
Person.self


/*:
 ---
 * 메타타입을 선언하는 방법
 ---
 */
/**======================
 [커스텀타입의 경우]
 - 클래스이름.Type
 - 구조체이름.Type
 - 열거형이름.Type

 [프로토콜의 경우]
 - 프로토콜이름.Protocol
========================**/




/*:
 ---
 * 메타타입을 사용하는 API
 ---
 */
/**=======================================
 - 1) 테이블뷰셀을 등록하는 경우에 메타타입을 사용
 =========================================**/

// tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)


/**=======================================
  - 2) JSONDecoder 객체를 사용해서 디코드메서드 사용시
 =========================================**/

// try? decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)




/**=========================================================
[AnyClass에 대한 이해]
 - typealias AnyClass = AnyObject.Type
 - https://developer.apple.com/documentation/swift/anyclass
============================================================**/






//Copyright (c) 2021 we.love.code.allen@gmail.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//distribute, sublicense, create a derivative work, and/or sell copies of the
//Software in any work that is designed, intended, or marketed for pedagogical or
//instructional purposes related to programming, coding, application development,
//or information technology.  Permission for such use, copying, modification,
//merger, publication, distribution, sublicensing, creation of derivative works,
//or sale is expressly withheld.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
