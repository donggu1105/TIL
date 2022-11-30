import UIKit

/*:
## 프로토콜의 메서드 디스패치(Witness Table)
 * Table Dispatch (Virtual Table / Witness Table)
 ---
 */
//:> 프로토콜 - Witness Table

protocol MyProtocol {
    func method1()    // 요구사항 - Witness Table
    func method2()    // 요구사항 - Witness Table
}


extension MyProtocol {
    // 요구사항의 기본 구현 제공
    func method1() { print("Protocol - Witness Table method1") }
    func method2() { print("Protocol - Witness Table method2") }
    
    // 필수 요구사항은 아님 ==> Direct Dispatch
    func anotherMothod() {
        print("Protocol Extension - Direct method")
    }
}



//:> 클래스 - Virtual Table

class FirstClass: MyProtocol {
    func method1() { print("Class - Virtual Table method1") }
    func method2() { print("Class - Virtual Table method2") }
    func anotherMothod() { print("Class - Virtual Table method3") }
}

/**==============================================================
[Class Virtual Table]
- func method1() { print("Class - Virtual Table method1") }
- func method2() { print("Class - Virtual Table method2") }
- func anotherMothod() { print("Class - Virtual Table method3") }
=================================================================**/

/**==============================================================
[Protocol Witness Table]
- func method1() { print("Class - Virtual Table method1") }   // 요구사항 - 우선순위 반영⭐️
- func method2() { print("Class - Virtual Table method2") }   // 요구사항 - 우선순위 반영⭐️
=================================================================**/



let first = FirstClass()
first.method1()           // Class - Virtual Table method1
first.method2()           // Class - Virtual Table method2
first.anotherMothod()     // Class - Virtual Table method3


let proto: MyProtocol = FirstClass()
proto.method1()           // Class - Virtual Table method1  (Witness Table)
proto.method2()           // Class - Virtual Table method2  (Witness Table)
proto.anotherMothod()     // Protocol Extension - Direct method








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
