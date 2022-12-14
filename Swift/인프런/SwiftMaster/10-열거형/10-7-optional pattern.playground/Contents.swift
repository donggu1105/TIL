import UIKit

/*:
 ## 옵셔널 패턴(Optional Pattern)
 * 옵셔널 타입에서 열거형 케이스 패턴을 더 간소화한 옵셔널 패턴(Optional Pattern)
 ---
 */
//:> 열거형 내부에 "연관값"을 사용시 ➞ 1) 열거형 케이스 패턴 / 2) 옵셔널 패턴

let a: Int? = 1


// 1) 열거형 케이스 패턴 (앞에서 배운)

switch a {
case .some(let z):
    print(z)
case .none:  // nil이라고 써도됨
    print("nil")
}


// 2) 옵셔널 패턴 (현재 배울)

switch a {
case let z?:      // .some을 조금 더 간소화하는 문법
    print(z)
case nil:         // .none 이라고 써도됨
    print("nil")
}



/*:
 ---
 * 옵셔널 패턴의 사례 (열거형 케이스 패턴과 비교)
 ---
 */

// 옵셔널타입으로 선언

let num: Int? = 7
print(num)



// 1) 열거형 케이스 패턴

switch num {
case .some(let x):      // let x = num
    print(x)
case .none:
    break
}


// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

switch num {
case let x?:           // let x? = Optional.some(num)
    print(x)
case .none:
    break
}



// 특정 사례만 다루는 (if문) ================================

// 1) 열거형 케이스 패턴

if case .some(let x) = num {
    print(x)
}



// 2) 옵셔널 패턴 (.some을 ? 물음표로 대체 가능한 패턴)

if case let x? = num {        // "옵셔널(?) 물음표를 띄어내고, x 상수로 보자"의 의미라고 생각하면 됨
    print(x)
}



/*:
 ---
 * 옵셔널 패턴(for문) - 옵셔널타입 요소 배열
 ---
 */

// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우, 옵셔널 패턴을 사용하면 편리함

let arrays: [Int?] = [nil, 2, 3, nil, 5]



// 1) 열거형 케이스 패턴

for case .some(let number) in arrays {
    print("Found a \(number)")
}



// 2) 옵셔널 패턴

for case let number? in arrays {
    print("Found a \(number)")
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
