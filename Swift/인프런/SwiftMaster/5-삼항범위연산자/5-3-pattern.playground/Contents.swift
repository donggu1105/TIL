import UIKit


/*:
 ## 3) 패턴매칭 연산자(~=)
 * 패턴매칭 연산자: 숫자가 범위내에 있는지 확인하는 연산자
 ---
 */
let range = 1...10

range ~= 5

// 결과 값은 참과 거짓




/*:
---
* 10 <= n <= 100 이런 문장은 스위프트에서 성립하지 않는다.
---
*/

var n = 20


if n >= 10 && n <= 100 {
    print("10이상, 100이하입니다.")
}


if 10...100 ~= n {
    print("10이상, 100이하입니다.")
}




/*:
---
* 연습
---
*/

var age = 31


if 20...29 ~= age {
    print("20대 입니다.")
}




// 스위치문은 내부적으로 패턴매칭 연산잘로 구현이 되어있음


switch age {
case 20...29:
    print("20대 입니다.")
case 30...39:
    print("30대 입니다.")
default :
    break
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
