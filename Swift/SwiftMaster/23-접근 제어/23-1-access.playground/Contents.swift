import UIKit

/*:
 # Part23 - 접근 제어
 */
/*:
 ## 접근 제어(Access Control)
 * 접근 제어의 기본 개념에 대한 이해. 왜 필요할까?
 ---
 */
// 코드의 세부 구현 내용을 숨기는 것이 가능하도록 만드는 개념(객체지향 - 은닉화가 가능해짐) ⭐️
// (언어마다 약간씩의 차이가 있음)


class SomeClass {
    private var name = "이름"      // 내부적으로만 사용하겠다고 제한
    
    func nameChange(name: String) {
        if name == "길동" {
            return             // 어떤 로직을 넣을 수도 있음
        }
        self.name = name
    }
}


let object1 = SomeClass()
//object1.name
//object1.name = "홍길동"
//object1.name


// 이름을 바꾸려면 특정 메서드로 실행만 가능
object1.nameChange(name: "민영")


/*:
 ---
 * 스위프트의 5가지 접근 수준
 ---
 */
/**===================================================================
 [접근 수준(Access Levels)]
 - 1) open        - 다른 모듈에서도 접근가능 / 상속 및 재정의도 가능 (제한 낮음)
 - 2) public      - 다른 모듈에서도 접근가능(상속/재정의불가)
 - 3) internal    - 같은 모듈 내에서만 접근가능(디폴트)
 - 4) fileprivate - 같은 파일 내에서만 접근가능
 - 5) private     - 같은 scope내에서만 접근가능                (제한 높음)
 
 - 모듈(module): 프레임워크, 라이브러리, 앱 등 import해서 사용할 수 있는 외부의 코드
 ====================================================================**/

// 따로 명시하지 않으면 internal 설정임(디폴트)
// 모듈(프레임워크나 라이브러리)을 만들어서 배포하려면, public이상으로 선언해야함


// 접근 제어를 가질 수 있는 요소는
// (스위프트 문서 - 엔터티 / 독립된 개체)
// 1) 타입(클래스/구조체/열거형/스위프트 기본타입 등)
// 2) 변수/속성
// 3) 함수/메서드(생성자, 서브스크립트 포함)
// 4) 프로토콜도 특정영역으로 제한될 수 있음


/**================================================
 - 클래스의 접근수준을 가장 넓히면 - open / 구조체 - public
 - 1) 클래스 - open (상속, 재정의와 관계)
 - 2) 구조체 - public (구조체는 어짜피 상속이 없기 때문)
===================================================**/
/*:
 ---
 * 기본 원칙
 ---
 */
//:> 타입은 타입을 사용하는 변수(속성)나, 함수(메서드)보다 높은 수준으로 선언되어야함
// 변수
// public variable에 속한 타입은 더 낮은 접근 수준을 가지지 못함
// (public/internal/fileprivate/private)
var some: String = "접근가능"


// 함수
// 파라미터, 리턴 타입이 더 낮은 접근 수준을 가지지 못함
// (internal/fileprivate/private)
internal func someFunction(a: Int) -> Bool {
    print(a)         // Int 타입
    print("hello")   // String 타입
    return true      // Bool 타입
}

// 자신보다 내부에서 더 낮은 타입을 사용하면 접근을 못해서, 사용하지 못할 수 있음

/*:
 ---
 * 기본 문법
 ---
 */
// 타입
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}


// 변수 / 함수
public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


// 아무것도 붙이지 않으면?
class SomeInternalClass1 {}         // 암시적인 internal 선언
let someInternalConstant1 = 0



/*:
 ---
 * 실무에서 사용하는 관습적인 패턴
 ---
 */
// 실제 프로젝트에서 많이 사용하는 관습적인 패턴
// 속성(변수)를 선언시 private으로 외부에 감추려는 속성은 _(언더바)를 사용해서 이름 지음

class SomeOtherClass {
    private var _name = "이름"         // 쓰기 - private
    
    var name: String {                // 읽기 - internal
        return _name
    }
}



// 저장속성의 (외부에서) 쓰기를 제한하기 ⭐️

class SomeAnotherClass {
    private(set) var name = "이름"      // 읽기 - internal / 쓰기 - private
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
