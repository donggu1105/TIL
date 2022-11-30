import UIKit

/*:
 ## 열거형에 (연관값이 없고), 옵셔널 열거형의 경우
 * switch문의 편의성 (열거형 case 패턴) - Enumeration Case Pattern
 ---
 */
// 열거형의 선언

enum SomeEnum {
    case left
    case right
}


// 타입을 다시 옵셔널 열거형으로 선언 ⭐️

let x: SomeEnum? = .left


/**==================================================
 [SomeEnum?의 의미] 옵셔널 열거형
 
 - 값이 있는 경우 .some ===> 내부에 다시 열거형 .left /.right
 - 값이 없는 경우 .none ===> nil
=====================================================**/


// 원칙

switch x {
case .some(let value):      // Optional.some(let value) = Optional.some(SomeEnum.left)  ⭐️
    switch value {
    case .left:
        print("왼쪽으로 돌기")
    case .right:
        print("오른쪽으로 돌기")
    }
case .none:
    print("계속 전진")
}



// 편의적 기능 제공 ⭐️

switch x {
case .some(.left):
    print("왼쪽으로 돌기")
case .some(.right):
    print("오른쪽으로 돌기")
case .none:
    print("계속 전진")
}



// 전체적으로 full name으로 풀어서 쓴다면..

//switch x {
//case Optional.some(SomeEnum.left):
//    print("왼쪽으로 돌기")
//case Optional.some(SomeEnum.right):
//    print("오른쪽으로 돌기")
//case Optional.none:
//    print("계속 전진")
//}


/*:
 ---
 * 스위치문의 편의성
 ---
 */
//:> switch문에서 옵셔널 열거형 타입을 사용할때, 벗기지 않아도 내부값 접근가능
// 스위치문은 옵셔널 열거형 타입의 사용시, 편의성을 제공


switch x {     // 예전에는 x! 라고 써줘야 했음 (스위치문에서 옵셔널 타입도 ok)
case .left:
    print("왼쪽으로 돌기")
case .right:
    print("오른쪽으로 돌기")
case nil:
    print("계속 전진")
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
