import UIKit


/*:
 ## 5) 프로토콜의 확장(Protocol Extension)
 * 프로토콜의 확장 - 프로토콜 지향 프로그래밍 ⭐️
 ---
 */

protocol Remote {
    func turnOn()
    func turnOff()
}


// 채택 ===> 실제구현해야함(여러타입에서 채택한다면 반복적으로 구현해야하는 점이 불편)

class TV1: Remote {
    //func turnOn() { print("리모콘 켜기") }
    //func turnOff() { print("리모콘 끄기") }
}


// 채택 ===> 실제구현해야함(여러타입에서 채택한다면 반복적으로 구현해야하는 점이 불편)

struct Aircon1: Remote {
    //func turnOn() { print("리모콘 켜기") }
    //func turnOff() { print("리모콘 끄기") }
}




//:>프로토콜의 확장 ➞ 기본(디폴트) 구현 제공 ⭐️
/**==============================================================================
 - (귀찮은 방식으로) 프로토콜을 채택한 모든 타입에서, 실제 구현을 계속적으로 반복해야하는 불편함을 덜기 위해
 - "프로토콜 확장"을 제공해서 메서드의 디폴트 구현을 제공함 (코드의 중복을 피할 수 있음)
===============================================================================**/


extension Remote {                         // (요구사항의 메서드 우선순위 적용 - 프로토콜 메서드 테이블 만듦)
    func turnOn() { print("리모콘 켜기") }    // 1. (채택)구현시 해당 메서드 2. 기본 메서드
    func turnOff() { print("리모콘 끄기") }   // 1. (채택)구현시 해당 메서드 2. 기본 메서드
    
    func doAnotherAction() {               // (요구사항 메서드 X - 테이블 만들지 않음)
        print("리모콘 또 다른 동작")            // 타입에 따른 선택 (Direct Dispatch)
    }
}




/*:
 ---
 * 프로토콜의 확장을 통한 다형성 제공 - 프로토콜 지향 프로그래밍
 ---
 */
// 클래스 ⭐️ ==================================================

class Ipad: Remote {
    func turnOn() { print("아이패드 켜기") }

    func doAnotherAction() { print("아이패드 다른 동작") }
}


/**=================================================
 [Class Virtual 테이블]
 - func turnOn()          { print("아이패드 켜기") }
 - func turnOff()         { print("리모콘 끄기") }
 - func doAnotherAction() { print("아이패드 다른 동작") }
====================================================**/


let ipad: Ipad = Ipad()
ipad.turnOn()           // 클래스 - V테이블
ipad.turnOff()          // 클래스 - V테이블
ipad.doAnotherAction()  // 클래스 - V테이블

// 아이패드 켜기
// 리모콘 끄기
// 아이패드 다른 동작



/**=====================================
 [Protocol Witness 테이블] - 요구사항
 - func turnOn()  { print("아이패드 켜기") }
 - func turnOff() { print("리모콘 끄기") }
========================================**/


let ipad2: Remote = Ipad()
ipad2.turnOn()           // 프로토콜 - W테이블
ipad2.turnOff()          // 프로토콜 - W테이블
ipad2.doAnotherAction()  // 프로토콜 - Direct (직접 메서드 주소 삽입)

// 아이패드 켜기
// 리모콘 끄기
// 리모콘 또 다른 동작





// 구조체 ⭐️ ==================================================

struct SmartPhone: Remote {
    func turnOn() { print("스마트폰 켜기") }

    func doAnotherAction() { print("스마트폰 다른 동작") }
}


/**=====================================
 [구조체] - 메서드 테이블이 없음
========================================**/


// 본래의 타입으로 인식했을때
var iphone: SmartPhone = SmartPhone()
iphone.turnOn()             // 구조체 - Direct (직접 메서드 주소 삽입)
iphone.turnOff()            // 구조체 - Direct (직접 메서드 주소 삽입)
iphone.doAnotherAction()    // 구조체 - Direct (직접 메서드 주소 삽입)

// 스마트폰 켜기
// 리모콘 끄기
// 스마트폰 다른 동작



/**=====================================
 [Protocol Witness 테이블] - 요구사항
 - func turnOn()  { print("스마트폰 켜기") }
 - func turnOff() { print("리모콘 끄기") }
========================================**/


// 프로토콜의 타입으로 인식했을때
var iphone2: Remote = SmartPhone()
iphone2.turnOn()            // 프로토콜 - W테이블
iphone2.turnOff()           // 프로토콜 - W테이블
iphone2.doAnotherAction()   // 프로토콜 - Direct (직접 메서드 주소 삽입)

// 스마트폰 켜기
// 리모콘 끄기
// 리모콘 또 다른 동작







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
