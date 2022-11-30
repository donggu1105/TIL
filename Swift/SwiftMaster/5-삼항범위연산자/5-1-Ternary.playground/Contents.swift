import UIKit

/*:
 # Part5 - 삼항 연산자와 범위연산자
 -
 */
/*:
 ## 1) 삼항 연산자(Ternary Conditional Operator)
 * 기본 형태 / if문보다 조금은 한정적인 형태로 사용 가능
 ---
 */

var a = 10


//if/else문

if a > 0 {
    print("1")
} else {
    print("2")
}




// 3항 연산자 (위의 if/else문과 완벽하게 동일)

a > 0 ? print("1") : print("2")




// 한줄인 경우
// 주로 값을 대입하는 경우 (주로 값에서 2가지에서 한가지를 선택하는 경우)


//:> 조건에 따라 선택이 두가지인 경우 ➞ 삼항연산자를 떠올리자

/*:
 ---
 * 사용 예시
 ---
 */
var name = a > 0 ? "스티브" : "팀쿡"


//위는 아래와 같다..

if a > 0 {
    name = "스티브"
} else {
    name = "팀쿡"
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


