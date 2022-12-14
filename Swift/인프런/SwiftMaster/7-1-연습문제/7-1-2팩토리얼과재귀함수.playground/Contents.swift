import UIKit


/*:
 # 연습문제
 -
 */
/*:
 ## 3) 팩토리얼 구현하기
 * 수학에서의 팩토리얼 5! = 5 x 4 x 3 x 2 x 1
 ---
 */
/**=======================================
- (고등학교 수학에서의 팩토리얼 개념)
-  5! = 5 x 4 x 3 x 2 x 1
-  4! = 4 x 3 x 2 x 1

-  n! == n * (n-1) * ... * 1  ( n >= 1 )
===========================================**/

/*:
---
* 팩토리얼을 함수로 구현
---
*/
// 어떻게 반복하도록 만들면 될까?


func factorial(num: Int) -> Int {
    
    var sum = 1
    
    for i in 1...num {
        sum = sum * i
    }
    
    return sum
}



factorial(num: 5)





/*:
 ## 재귀함수
 * 자기 자신을 반복해서 호출하는 함수
 ---
 */
// 자기 자신을 반복해서 호출하는 함수: 재귀함수

// 5! = 5 * (4 * 3 * 2 * 1)
// 5! = 5 * (4!)



func factorialF(num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    return num * factorialF(num: num - 1)
}


factorialF(num: 5)




//:> 재귀함수를 구현할 때는 자칫 잘못하면, 스택오버플로우 현상이 일어날 수 있으므로 주의!






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




