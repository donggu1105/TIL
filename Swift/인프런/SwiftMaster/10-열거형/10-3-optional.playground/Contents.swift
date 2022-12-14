import UIKit

/*:
 ## 옵셔널 타입에 대한 정확한 이해
 * 스위프트의 옵셔널(Optional) 타입
 ---
 */
/**==========================
 - 옵셔널 타입의 내부 구현
 
   enum Optional<Wrapped> {     // 제네릭 문법
       case some(Wrapped)
       case none
   }
============================**/


var num: Int? = 7

// 열거형(한정된 사례)
//Optional.some(7)
//Optional.none




switch num {
case .some(let a):  // let a = 7     // 열거형 case 패턴을 활용해서, 내부 연관값을 꺼냄
    print(a)
case .none:
    print("nil")
    //print(num!)
}



//switch num {
//case Optional.some(let a):
//    print(a)
//case Optional.none:
//    print("nil")
//}



//:> .none과 nil은 완전히 동일
// .none은 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil키워드를 사용할뿐






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
