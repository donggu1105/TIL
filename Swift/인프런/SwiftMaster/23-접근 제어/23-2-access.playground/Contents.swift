import UIKit


/*:
 ## 커스텀 타입의 접근 제어
 * 사용자 정의 타입(Custom)의 접근 제어
 ---
 */
//:> 타입의 내부 멤버는 타입 자체의 접근 수준을 넘을 수 없음
// 타입의 접근 제어 수준은 (해당 타입)멤버의 접근 제어 수준에 영향을 미침
// (예시) 타입이 internal 로 선언 되면 내부의 멤버는 internal이하(internal / fileprivate / private)로 설정됨


public class SomePublicClass {                         // 명시적인 public 선언
    open var someOpenProperty = "SomeOpen"             // open 이라고 설정해도 public으로 작동 ⭐️
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"          // 원래의 기본 수준
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


let somePublic = SomePublicClass()
somePublic.someOpenProperty
somePublic.somePublicProperty
somePublic.someInternalProperty
somePublic.someFilePrivateProperty                    // 같은 파일 안이기 때문에 접근 가능
//somePublic.somePrivateProperty



//===========================================================


class SomeInternalClass {                             // 암시적인 internal 선언
    open var someOpenProperty = "SomeOpen"            // open 이라고 설정해도 internal으로 작동 ⭐️
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


let someInternal = SomeInternalClass()
someInternal.someOpenProperty
someInternal.somePublicProperty
someInternal.someInternalProperty
someInternal.someFilePrivateProperty                 // 같은 파일 안이기 때문에 접근 가능
//someInternal.somePrivateProperty



//===========================================================


fileprivate class SomeFilePrivateClass {             // 명시적인 file-private 선언
    open var someOpenProperty = "SomeOpen"
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}


// 변수선언(internal) <===> 타입선언(fileprivate)은 불가능 (fileprivate / private 선언가능)
//internal let someFilePrivate = SomeFilePrivateClass()


fileprivate let someFilePrivate = SomeFilePrivateClass()
someFilePrivate.someOpenProperty                    // fileprivate
someFilePrivate.somePublicProperty                  // fileprivate
someFilePrivate.someInternalProperty                // fileprivate
someFilePrivate.someFilePrivateProperty             // 같은 파일 안이기 때문에 접근 가능
//someFilePrivate.somePrivateProperty




private let someFilePrivate2 = SomeFilePrivateClass()   // 현재의 scope에서 private



//===========================================================

//:> 타입자체를 private으로 선언하는 것은 의미가 없어짐 ➞ fileprivate으로 동작
// 타입을 private으로 선언하면 아무곳에서도 사용할 수 없기 때문에 의미가 없음 ⭐️

private class SomePrivateClass {                    // 명시적인 private 선언
    open var someOpenProperty = "SomeOpen"
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    var someFilePrivateProperty = "SomeFilePrivate"     // 실제 fileprivate 처럼 동작 ⭐️ (공식문서 오류)
    private var somePrivateProperty = "SomePrivate"
}


fileprivate let somePrivate = SomePrivateClass()
somePrivate.someOpenProperty
somePrivate.somePublicProperty
somePrivate.someInternalProperty
somePrivate.someFilePrivateProperty             // 같은 파일 안이기 때문에 접근 가능
//somePrivate.somePrivateProperty




// 튜플, 함수, 열거형(원시값, 연관값)에 대한 접근제어 관련 구체적인 법칙이 있지만, 필요할때 찾아서 사용



/*:
 ## 내부 멤버의 접근 제어 수준
 * 내부 멤버(Nested Type)의 접근 제어
 ---
 */
//:> 내부 멤버가 명시적선언을 하지 않는다면, 접근 수준은 internal로 유지
// 타입의 접근 수준이 높다고, 내부 멤버의 접근 수준이 무조건 따라서 높아지는 것 아님


open class SomeClass {
    var someProperty = "SomeInternal"
    // internal 임 ➞ 클래스와 동일한 수준을 유지하려면 명시적으로 open선언 필요
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
