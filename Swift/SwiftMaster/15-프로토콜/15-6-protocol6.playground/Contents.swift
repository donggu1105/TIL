import UIKit


/*:
 ## 4) 선택적 요구사항의 구현(Optional Protocol Requirements)
 * 어트리뷰트
 ---
 */
/**==================================================================================
 - 어튜리뷰트 키워드
 - @available, @objc, @escaping, @IBOutlet, @IBAction 등등

 - Attribute(어트리뷰트) ===> 컴파일러에게 알려주는 특별한 신호이자, 추가적인 정보를 제공 (2가지 종류가 있음)
 - https://docs.swift.org/swift-book/ReferenceManual/Attributes.html

 - 1) 선언에 대한 추가정보 제공
 - 2) 타입에 대한 추가정보 제공


 - 사용 방법
 - @어트리뷰트이름          ======> (예시)  @available
 - @어트리뷰트이름(아규먼트)  ======> (예시)  @available(iOS *)
==================================================================================**/


// (실제 예시)

@available(iOS 10.0, macOS 10.12, *)
class SomeType {      // "SomeType" 선언은 iOS 10.0 버전이상에서만 읽을 수 있음
    
}



/*:
 ---
 * 선택적인(구현해도 되고 안해도 되는) 멤버선언하기
 ---
 */
/**========================================================================
 - @objc는 스위프트로 작성한 코드를 오브젝티브C 코드에서도 사용할 수 있게 해주는 어트리뷰트
 - 프로토콜에서 요구사항 구현시, 반드시 강제하는 멤버가 아니라 선택적인 요구사항으로 구현할때 사용
 
 - 프로토콜 앞에는 "@objc"추가
 - 멤버 앞에는 "@objc optional"을 모두 추가
==========================================================================**/


@objc protocol Remote {
    @objc optional var isOn: Bool { get set }
    func turnOn()
    func turnOff()
    @objc optional func doNeflix()
}


class TV: Remote {
    var isOn = false
    
    func turnOn() {}
    
    func turnOff() {}
    
}


/**========================================================
 - 선택적 멤버를 선언한 프로토콜 구현시
 - 오브젝티브-C에 해당하는 클래스 전용 프로토콜임 (구조체, 열거형 채용 불가) ⭐️
 - (오브젝티브C는 구조체와 열거형에서 프로토콜 채택을 지원하지 않음)
==========================================================**/


let tv1: TV = TV()
print(tv1.isOn)   // Bool타입



let tv2: Remote = TV()
print(tv2.isOn)          // Bool? 타입 (선택적 구현 사항이기 때문에 해당 멤버가 없으면 ===> nil로 반환)
tv2.doNeflix?()          // (선택적으로 선언했기 때문에, 함수가 없을 수도 있음 ===> 옵셔널체이닝 필요)












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
