import UIKit


/*:
## 프로토콜에서의 제네릭 문법의 사용
* 프로토콜에서 제네릭의 사용 - Associated Types(연관 타입)
---
*/
/**================================================
 - 프로토콜을 제네릭 방식으로 선언하려면 어떻게 해야할까?
 - 연관타입(Assiciated Types)으로 선언해야함 ⭐️

 - 프로토콜은 타입들이 채택할 수 있는 한차원 높은 단계에서
   요구사항만을 선언(자격증)하는 개념이기 때문에
   제네릭 타입과 조금 다른 개념(연관타입)을 추가적으로 도입한 것 뿐
 
 [프로토콜 방식]
 - <T> ===> associatedtype T
 =================================================**/


protocol RemoteControl {           // <T>의 방식이 아님
    associatedtype T               // 연관형식은 대문자로 시작해야함(UpperCamelcase)
    func changeChannel(to: T)      // 관습적으로 Element를 많이 사용
    func alert() -> T?
}



// 연관형식이 선언된 프로토콜을 채용한 타입은, typealias로 실제 형식을 표시해야함

struct TV: RemoteControl {
    
    typealias T = Int       // 생략 가능
    
    func changeChannel(to: Int) {
        print("TV 채널바꿈: \(to)")
    }
    
    func alert() -> Int? {
        return 1
    }

}



class Aircon: RemoteControl {

    // 연관형식이 추론됨
    
    func changeChannel(to: String) {
        print("Aircon 온도바꿈: \(to)")
    }

    func alert() -> String? {
        return "1"
    }

}



/*:
---
* 연관 형식에 제약을 추가한다면
---
*/

protocol RemoteControl2 {
    associatedtype Element: Equatable     // <T: Equatable> 제약조건 추가
    func changeChannel(to: Element)
    func alert() -> Element?
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
