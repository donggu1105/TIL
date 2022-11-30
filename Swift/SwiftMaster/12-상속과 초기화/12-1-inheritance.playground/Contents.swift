import UIKit


/*:
# Part12 - 클래스의 상속과 초기화
*/
/*:
## 1) 클래스의 상속
 * 상속(Inheritance)
 ---
 */
//:> 상속은 유일하게 클래스에서만 지원하는 기능(구조체는 상속 불가능)

/**=============================================================
 - 상속은 쉽게 말하면, 본질적으로 성격이 비슷한 타입을 새로만들어
 - 1) 데이터(저장속성)를 추가하거나 2) 기능(메서드)를 변형시키서 사용하려는 것
=============================================================**/


/*:
---
* 상속의 기본 문법
---
*/

class AClass {
    var name = "이름"
}


class BClass: AClass {
    // name
    var id = 0
}


let b = BClass()


// BClass는 AClass를 상속해서 구현
// 서브클래스는 슈퍼클래스로부터 멤버를 상속함


// 클래스의 상속 금지의 키워드 final
// (경우에 따라서, 클래스의 상속을 금지해야하는 경우가 있음)


// (final를 각 멤버 앞에 붙인 경우, 해당 멤버 재정의 불가라는 뜻)

/*:
 ---
 * 상속(Inheritance)의 예시
 ---
 */
//:> 기본적으로 상속은 데이터(저장 속성)을 추가하는 관점에서 생각

class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
}


class Student: Person {
    // id
    // name
    // email
    
    var studentId = 0
}



class Undergraduate: Student {
    // id
    // name
    // email
    // studentId
    
    var major = "전공"
}




// 상위 클래스에서 존재하는 멤버를 변형하는 것을 재정의라고 함
// 재정의를 하려는 멤버에는 override 키워드를 붙여야함 (자세한 내용은 다음 강의에서 다룰 예정)


/*:
---
* UIKit의 상속 구조
---
*/
/**=================================================================================
 - 실제 예시 - 상속이 어떤 식으로 쓰일 까?

 - 애플이 미리 만들어 놓은 UIKit에서는 상속의 구조가 세밀하고 복잡하게 만들어져 있음
 - 상속의 구조를 외울 필요는 없고, 대략적인 내용만 이해하면 됨 =====> 프레임워크 강의에서 자세하게 설명 예정
 ====================================================================================**/








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
