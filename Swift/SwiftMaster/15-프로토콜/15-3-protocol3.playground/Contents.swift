import UIKit


/*:
 ## 2-2) 메서드의 요구사항 정의하는 방법
 * 메서드 요구사항 정의
 ---
 */
/**===============================================================
 [프로토콜 메서드 요구사항]
 - 메서드의 헤드부분(인풋/아웃풋)의 형태만 요구사항으로 정의
 - mutating 키워드: (구조체로 제한하는 것은 아님) 구조체에서 저장 속성 변경하는 경우,
                  구조체도 채택 가능하도록 허락하는 키워드
 - 타입 메서드로 제한 하려면, static키워드만 붙이면 됨
   (채택해서 구현하는 쪽에서 static / class 키워드 모두 사용 가능)
=================================================================**/

// 1) 정의
protocol RandomNumber {
    static func reset()         // 최소한 타입 메서드가 되야함 (class로 구현해서 재정의를 허용하는 것도 가능)
    func random() -> Int
    //mutating func doSomething()
}


// 2) 채택 / 3) 구현
class Number: RandomNumber {
    
    static func reset() {
        print("다시 셋팅")
    }
    
    func random() -> Int {
        return Int.random(in: 1...100)
    }
    
}


let n = Number()
n.random()
Number.reset()




// 1) 정의
protocol Togglable {
    mutating func toggle()        // mutating의 키워드는 메서드 내에서 속성 변경의 의미일뿐(클래스에서 사용 가능)
}


// 2) 채택 / 3) 구현
enum OnOffSwitch: Togglable {
    case on
    case off
    
    mutating func toggle() {
        switch self {   // .on   .off
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}


var s = OnOffSwitch.off
s.toggle()
s.toggle()


class BigSwitch: Togglable {
    var isOn = false
    
    func toggle() {      // mutating 키워드 필요없음 (클래스 이기 때문)
        isOn = isOn ? false : true
    }
}


var big = BigSwitch()
print(big.isOn)
big.toggle()
print(big.isOn)



/*:
 ---
 * 메서드 요구사항 - 생성자 요구사항
 ---
 */
protocol SomeProtocol {     // 생성자를 요구사항으로 지정 가능
    init(num: Int)
}


/**===================================================================
 [생성자 요구사항] (실제 프로젝트에서 사용하는 경우 드뭄)
 - (1) 클래스는 (상속 고려해야함) 생성자 앞에 required를 붙여야함 (하위에서 구현을 강제)
       (구조체의 경우 상속이 없기 때문에, required키워드 필요 없음)
 - (2) 아니면 final을 붙여서 상속을 막으면 required 생략가능
 - (3) 클래스에서는 반드시 지정생성자로 구현할 필요없음(편의생성자로 구현도 가능)
 =====================================================================**/

// 예제 - 1 ======================

class SomeClass: SomeProtocol {
    required init(num: Int) {
        // 실제 구현
    }
}

class SomeSubClass: SomeClass {
    // 하위 클래스에서 생성자 구현 안하면 필수 생성자는 자동 상속
    // required init(num: Int)
    
}



// 예제 - 2 ======================

protocol AProtocol {
    init()
}

class ASuperClass {
    init() {
        // 생성자의 내용 구현
    }
}

class ASubClass: ASuperClass, AProtocol {
    // AProtocol을 채택함으로 "required" 키워드 필요하고, 상속으로 인한 "override(재정의)" 재정의 키워드도 필요
    required override init() {
        // 생성자의 내용 구현
    }
}


/*:
 ---
 * 생성자 요구사항 - 실패가능 생성자의 경우
 ---
 */
/**==========================================================
 (실패가능/불가능 생성자 요구사항)
 - init?() 요구사항 ➡︎  init() / init?() / init!()로 구현 (O)
 - init()  요구사항 ➡︎  init?() 로 구현 (X - 범위가 더 넓어지는 것 안됨)
 ===========================================================**/

// 실패가능 생성자

protocol AProto {
    init?(num: Int)        // (객체의 타입이 맞을까?)  AClass? <==== AClass은 범위가 속해있음
}


// 구조체에서 채택 (required 키워드는 필요없음)

struct AStruct: AProto {  // Failable/Non-failable 모두 요구사항을 충족시킴
    
    //init?(num: Int) {}
    
    init(num: Int)  {}
    
    //init!(num: Int)  {}     // 이것도 괜찮음
}


// 클래스에서 채택

class AClass: AProto {
    required init(num: Int) {}
}


/*:
 ---
 * 메서드 요구사항 - 서브스크립트 요구사항
 ---
 */
/**===================================================================
 [서브스크립트 요구사항]
 - get, set 키워드를 통해서 읽기/쓰기 여부를 설정 (최소한의 요구사항일뿐)
 - get키워드 ===> 최소한 읽기 서브스크립트 구현 / 읽기,쓰기 모두 구현 가능
 - get/set키워드 ===> 반드시 읽기,쓰기 모두 구현해야함
 =====================================================================**/


protocol DataList {
    subscript(idx: Int) -> Int { get }     // (서브스크립트 문법에서) get 필수 (set 선택)
}



struct DataStructure: DataList {
    
//    subscript(idx: Int) -> Int {    // 읽기 전용 서브스크립트로 구현한다면
//        get {
//            return 0
//        }
//    }
    
    subscript(idx: Int) -> Int {    // (최소한만 따르면 됨)
        get {
            return 0
        }
        set {                 // 구현은 선택
            // 상세구현 생략
        }
    }
}


/*:
 ---
 * (관습적인) 프로토콜 채택과 구현 - 확장(Extension)에서
 ---
 */
protocol Certificate {
    func doSomething()
}


class Person {
    
}

// 관습적으로 본체보다는 확장에서, 채택 구현 (코드의 깔끔한 정리 가능)
extension Person: Certificate {
    func doSomething() {
        print("Do something")
    }
}






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
