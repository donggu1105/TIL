import UIKit


/*:
 ## Switch문의 활용
 * 스위치문과 밸류바인딩(Value Binding)
 ---
 */

// 바인딩의 일반적인 의미

var a = 7


let b = a     // 바인딩을 한다. (다른 변수/상수의 새로운 식별자로 할당한다.)



//:> 바인딩: 다른 새로운 변수/상수 식별자로 할당




// 스위치문에서의 바인딩

var num = 6


switch num {
case let a:      // let a = num
    print("숫자: \(a)")
default:
    break
}




/*:
---
* 스위치문과 where절 (스위치문에서 조건을 확인하는 방식)
---
*/
// 일단 다른 상수 값에 바인딩한(넣은) 후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인
// (바인딩 된 상수는 케이스블럭 내부에서만 사용가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)

num = 7

switch num {
case let x where x % 2 == 0:      // let x = num
    print("짝수 숫자: \(x)")
case let x where x % 2 != 0:
    print("홀수 숫자: \(x)")
default:
    break
}



switch num {
case let n where n <= 7:         // let n = num
   print("7이하의 숫자: \(n)")
default:
   print("그 이외의 숫자")
}



switch num {
case var x where x > 5:       // 변수로 바인딩도 가능 var x = num
    x = 7
    print(x)
default:
    print(num)
}



// where절은 대부분 밸류바인딩 패턴과 함께 사용 (여러 강의에서 또 다룰 예정)


//:> where키워드는 조건을 확인하는 키워드






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
