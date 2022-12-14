import UIKit


/*:
 ## 2) 프로토콜(Protocols) 문법
 * 프토토콜의 기본 문법
 ---
 */
// 프로토콜? 규약 (약속)  ======> "자격증"

// 1) 정의
protocol MyProtocol {   // 최소한의 요구사항 나열

}

//:> 클래스에서 상속이 있는 경우, 1) 상위 클래스를 먼저 선언 후, 2) 프로토콜 채택 선언

class FamilyClass { }


// 2) 채택 (클래스, 구조체, 열거형 다 가능)
class MyClass: FamilyClass, MyProtocol {    // 상위클래스인 FamilyClass를 먼저 선언
    // 3) (속성/메서드) 구체적인 구현
}


struct MyStruct: MyProtocol {
    // 3) (속성/메서드) 구체적인 구현
}


enum MyEnum: MyProtocol {
    // 3) (속성/메서드) 구체적인 구현
}

/*:
 ---
 * 프로토콜의 요구사항의 종류
 ---
 */
/**========================================================================
 - 프로토콜을 채택하려는 클래스, 구조체, 열거형에 최소한 이런 내용을 구현해야한다고 선언하는 부분

 - 1. 속성 요구사항
 - 2. 메서드 요구사항 (메서드/생성자/서브스크립트)
==========================================================================**/



/*:
 ## 2-1) 속성의 요구사항 정의하는 방법
 * 속성 요구사항 정의
 ---
 */
/**=====================================================
  [프로토콜 속성의 요구사항]
 - 속성의 뜻에서 var로 선언 (let으로 선언할 수 없음)
 - get, set 키워드를 통해서 읽기/쓰기 여부를 설정 (최소한의 요구사항일뿐)
 - 저장 속성/계산 속성으로 모두 구현 가능
=======================================================**/


protocol RemoteMouse {
    
    var id: String { get }                // ===> let 저장속성 / var 저장속성 / 읽기계산속성 / 읽기,쓰기 계산속성
    
    var name: String { get set }          // ===> var 저장속성 / 읽기,쓰기 계산속성

    static var type: String { get set }   // ===> 타입 저장 속성 (static)
                                          // ===> 타입 계산 속성 (class)
}


// 채택하면, (최소한의)요구사항을 정확하게 따라서 구현해야함

// 인스턴스 저장/계산 속성 =========================

struct TV: RemoteMouse {
    
    var id: String = "456"
    
    var name: String = "삼성티비"
    
    static var type: String = "리모콘"
}


let myTV = TV()
myTV.id
myTV.name
TV.type


// 타입 속성 ===================================
// 1) 저장 타입 속성으로 구현

class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }
    
    var name: String {
        get { "아이폰" }
        set { }
    }
    
    static var type: String = "리모콘"     // 타입 저장 속성은 (상속은 되지만) 재정의 원칙적 불가능
}


// 2) 계산 타입 속성으로 구현

class Ipad: RemoteMouse {
    var id: String = "777"
    
    var name: String = "아이패드"
    
    class var type: String {       // 타입 계산 속성은 재정의 가능 (class키워드 가능)
        get { "리모콘" }
        set { }
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

