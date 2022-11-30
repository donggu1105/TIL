import UIKit

/*:
 ## 3) Hashable 프로토콜
 * Hashable 프로토콜의 역할(유일한 값을 갖도록 해서, Dictionary의 키값 또는 Set의 요소가 될 수 있음)
 ---
 */
/**=========================================================
 - Hashable 프로토콜의 요구사항은
 - func hash(into hasher: inout Hasher) 메서드의 구현
 
 - 예전 버전에서는 var hashValue: Int { get } 와 같이
   hashValue 계산 속성으로 구현되어있었음 / 현재는 위의 방식으로 구현해야함
 
 - 스위프트에서 제공하는 기본 숫자 타입은 모두 다 채택을 하고 있음
 ===========================================================**/


let num1: Int = 123
let num2: Int = 456

let set: Set = [num1, num2]
// Int가 해셔블하기 때문에, Set의 원소가 될 수 있음



let str1: String = "Hello"
let str2: String = "안녕"


let set2: Set = [str1, str2]
// String이 해셔블하기 때문에, Set의 원소가 될 수 있음



//123.hashValue    // ===> 이 방식은 현재 deprecated되었음(앞으로 사용못하게될 예정)

/**=============================================================
 [Int의 내부 구현]
     extension Int : Hashable {

         @inlinable public func hash(into hasher: inout Hasher)

         public var hashValue: Int { get }
     }
================================================================**/





//:> 원칙: 커스텀타입이 딕셔너리의 키값이나 Set의 요소로 사용가능 하려면, Hashable을 채택하면 ➞ hash(into:)메서드 자동구현
/**=========================================================================
 원칙) 구조체, 열거형의 경우 Hashable 프로토콜 채택시 모든 저장 속성(열거형은 모든 연관값)이
      Hashable 프로토콜을 채택한 타입이라면, hash(into:)메서드 자동구현
 예외) 1) 클래스는 인스턴스의 유일성 갖게 하기위해서는 hash(into:)메서드 직접 구현해야함
         (클래스는 원칙적으로 Hashable 지원 불가)
      2) 열거형의 경우 연관값이 없다면 기본적으로 Equatable/Hashable하기 때문에
         Hashable 프로토콜을 채택하지 않아도 됨
============================================================================**/

/*:
 ---
 * 1) 열거형(Enum)의 경우
 ---
 */
// 원칙) 구조체, 열거형의 경우 Equatable 프로토콜 채택시 모든 저장 속성(열거형은 모든 연관값)이
//      Hashable 프로토콜을 채택한 타입이라면, hash(into:)메서드 자동구현
//      (추가정보들이 Int, Double 등 이미 Hashable프로토콜을 채택해서, 구체적인 정보들까지 유일성 판별이 가능하기 때문)

enum SuperComputer: Hashable {
    case cpu(core: Int, ghz: Double)
    case ram(Int)
    case hardDisk(gb: Int)
}



let superSet: Set = [SuperComputer.cpu(core: 8, ghz: 3.5), SuperComputer.cpu(core: 16, ghz: 3.5)]






// 예외-2) 연관값이 없다면(원시값 여부는 상관없음) Hashable 프로토콜을 채택하지 않아도 유일성 판별 가능
// ===> 기본적으로 추가정보가 없다면 유일성 판별 가능하다는 논리 ⭐️


enum Direction {
    case east
    case west
    case south
    case north
}


let directionSet: Set = [Direction.north, Direction.east]





/*:
 ---
 * 2) 구조체(Struct)의 경우
 ---
 */
// 원칙) 구조체, 열거형의 경우 Hashable 프로토콜 채택시 모든 저장 속성(열거형은 모든 연관값)이
//      Hashable 프로토콜을 채택한 타입이라면, hash(into:)메서드 자동구현
//     (저장속성이 Int, Double 등 이미 Hashable프로토콜을 채택해서, 유일성 판별이 가능하기 때문)


struct Dog {
    var name: String
    var age: Int
}

extension Dog: Hashable {}


// 이렇게 전체 구현할 필요 없음
//extension Dog: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(age)
//    }
//}


let dog1: Dog = Dog(name: "초코", age: 10)
let dog2: Dog = Dog(name: "보리", age: 2)


let dogSet: Set = [dog1, dog2]

/*:
 ---
 * 3) 클래스(Class)의 경우
 ---
 */
// 예외-1) 클래스는 인스턴스의 유일성 갖게 하기위해서는 hash(into:)메서드 직접 구현해야함
//       (클래스는 원칙적으로 Hashable 지원 불가)



class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


// Set에 넣고 싶어서, Hashable 프로토콜 채택 ====> 클래스에서는 에러 발생 ===> hash(into:)메서드 직접구현해야함
// extension Person: Hashable {}


extension Person: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
    
    // == 연산자도 직접구현해야함
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}



let person1: Person = Person(name: "홍길동", age: 20)
let person2: Person = Person(name: "임꺽정", age: 20)


let personSet: Set = [person1, person2]







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
