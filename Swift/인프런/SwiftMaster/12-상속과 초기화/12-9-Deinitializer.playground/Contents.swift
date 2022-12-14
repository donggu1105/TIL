import UIKit


/*:
## 소멸 - 초기화 해제
 * 소멸(Deinitialization)
 ---
 */
/**==================================================================
 - 소멸자
 - 인스턴스가 메모리에서 해제되기 직전 정리가 필요한 내용을 구현하는 메서드
 - 클래스 정의시 클래스에는 최대 1개의 소멸자(deinitializer)를 정의 가능
 - 소멸자는 파라미터(매개 변수)를 사용하지 않음
 
 - 소멸자(초기화 해제) 작동 방식
 - Swift는 클래스의 인스턴스(객체)를 자동 참조 계산(ARC) 방식을 통해 메모리 관리
 - 일반적인 경우(강한 순환 참조를 제외한)에는 메모리에서 해제될때
 - 수동으로 관리를 수행할 필요가 없음
 
 
 - 그러나 특별한 작업을 수행중인 경우, 몇가지 추가 정리를 직접 수행해야 할 수 있음
 - 예) 인스턴스에서 파일을 열고 일부 데이터를 쓰는 경우,
      클래스 인스턴스가 할당 해제되기 전에 파일을 닫아야 파일에 손상이 안 갈 수 있음
 - 소멸자에서는 인스턴스의 모든 속성에 액세스 할 수 있으며
   해당 속성을 기반으로 동작을 수정할 수 있음 (예 : 닫아야하는 파일의 이름 조회)
 
 
 [상속이 있는 경우]
 - 상위클래스 소멸자는 해당 하위클래스에 의해 상속됨
 - 상위클래스 소멸자는 하위클래스 소멸자의 실행이 끝날 때 자동으로 호출됨
 - 상위클래스 소멸자는 하위클래스가 자체적인 소멸자를 제공하지 않더라도 항상 호출됨
====================================================================**/


/*:
---
* 소멸자(Deinitialers)
---
*/

class Aclass {
    var x = 0
    var y = 0
    
    deinit {
        print("인스턴스의 소멸 시점")
    }
}



var a: Aclass? = Aclass()
a = nil   // 메모리에 있던 a인스턴스가 제거됨


//:> 소멸자는 클래스에만 존재
// 생성자는 필요한 만큼 구현할 수 있지만, 소멸자는 하나만 구현 가능함
// 소멸자는 직접호출할 수 없고(직접 호출하는 문법이 없고),
// 인스턴스(객체)가 메모리에서 제거되기 직전에 자동으로 호출됨⭐️








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
