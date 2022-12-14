import UIKit

/*:
# Part16 - Method Dispatch
*/
/*:
## 메서드 디스패치(Method Dispatch)
 * 1 - 직접 디스패치 Direct Dispatch (Static)
 ---
 */
struct MyStruct {
    func method1() { print("Struct - Direct method1") }
    func method2() { print("Struct - Direct method2") }
}


let myStruct = MyStruct()
myStruct.method1()
myStruct.method2()



/*:
 ---
 * 2 - 테이블 디스패치 Table Dispatch (동적 디스패치)
 ---
 */

class FirstClass {
    func method1() { print("Class - Table method1") }
    func method2() { print("Class - Table method2") }
}

/**================================================
 func method1() { print("Class - Table method1") }
 func method2() { print("Class - Table method2") }
===================================================**/


// 자식클래스에서 테이블을 따로 보유
class SecondClass: FirstClass {
    override func method2() { print("Class - Table method2-2") }
    func method3() { print("Class - Table method3") }
}

/**================================================
 func method1() { print("Class - Table method1") }
 func method2() { print("Class - Table method2-2") }
 func method3() { print("Class - Table method3") }
===================================================**/



let first = FirstClass()
first.method1()
first.method2()


let second = SecondClass()
second.method1()
second.method2()
second.method3()


/*:
 ---
 * 3 - 메세지 디스패치 Message Dispatch (메세지 디스패치)
 ---
 */
/**============================================
 - 예전 Objective-C 에서 사용하던 방식
 - 방식에 대한 이해만 하면됨. 문법에 관련된 내용은 아니므로
   굳이 암기할 필요는 없음
=============================================**/


class ParentClass {
    @objc dynamic func method1() { print("Class - Message method1") }
    @objc dynamic func method2() { print("Class - Message method2") }
}


/**================================================
 func method1() { print("Class - Message method1") }
 func method2() { print("Class - Message method2") }
===================================================**/



class ChildClass: ParentClass {
    @objc dynamic override func method2() { print("Class - Message method2-2") }
    @objc dynamic func method3() { print("Class - Message method3") }
}


/**================================================
 super class
 func method2() { print("Class - Message method2-2") }   // 재정의한 메서드는 다시 주소가짐
 func method2() { print("Class - Message method3") }
===================================================**/


let child = ChildClass()
child.method1()
child.method2()
child.method3()







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
