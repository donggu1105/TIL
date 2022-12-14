import UIKit


/*:
 ## 3-2) 기타 프로토콜(Protocols)관련 문법
 * 프로토콜은 1) 프로토콜 간에 상속이 가능하고 2) 다중 상속이 가능
 ---
 */
//:> 프로토콜도 상속이 가능 / 다중 상속이 가능 (어짜피 여러가지 요구사항의 나열일뿐)

protocol Remote {
    func turnOn()
    func turnOff()
}


protocol AirConRemote {
    func Up()
    func Down()
}


protocol SuperRemoteProtocol: Remote, AirConRemote {   // 프로토콜끼리, 상속 구조를 만드는 것이 가능 ⭐️
    // func turnOn()
    // func turnOff()
    // func Up()
    // func Down()
    
    func doSomething()
}


// 프로토콜의 채택 및 구현

class HomePot: SuperRemoteProtocol {
    func turnOn() { }
    
    func turnOff() { }
    
    func Up() { }
    
    func Down() { }
    
    func doSomething() { }
}



/*:
 ---
 * 클래스 전용 프로토콜 (AnyObject)
 ---
 */
// 클래스 전용 프로토콜로 선언
// (AnyObject프로토콜을 상속)

protocol SomeProtocol: AnyObject {      // AnyObject는 클래스 전용 프로토콜
    func doSomething()
}


// 구조체에서는 채택할 수 없게 됨 ⭐️
//struct AStruct: SomeProtocol {
//
//}


// 클래스에서만 채택 가능
class AClass: SomeProtocol {
    func doSomething() {
        print("Do something")
    }
}



/*:
 ---
 * 프로토콜 합성(Protocol Composition) 문법
 ---
 */
// 프로토콜을 합성하여 임시타입으로 활용 가능 ⭐️

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}


// 하나의 타입에서 여러개의 프로토콜을 채택하는 것 당연히 가능 (다중 상속과 비슷한 역할)

struct Person: Named, Aged {
    var name: String
    var age: Int
}


// 프로토콜을 두개를 병합해서 사용 하는 문법(&로 연결)
func wishHappyBirthday(to celebrator: Named & Aged) {   // 임시적인 타입으로 인식
    print("생일축하해, \(celebrator.name), 넌 이제 \(celebrator.age)살이 되었구나!")
}


let birthdayPerson = Person(name: "홍길동", age: 20)
wishHappyBirthday(to: birthdayPerson)



let whoIsThis: Named & Aged = birthdayPerson      // 임시적인 타입으로 저장 (두개의 프로토콜을 모두 채택한 타입만 저장 가능)







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
