import UIKit


/*:
## for문 주의점
* for문에서 선언하는 변수(상수)에 대한 정확한 이해
---
*/
/**====================================================
 for문의 임시 상수
 - 1) for문이 진행되는 동안 사용이 되는 임시적인 상수(let)이다.
 - 2) for문에서 선언하는 변수(상수)는 for문 내에서만 사용이 가능하다.
======================================================= **/


var name = "홍길동"


for name in 1...5 {
    print(name)
}



for n in 1...5 {
    print(name)
}


//print(n)




/**===================================================
 일반적인 변수 (범위 - 스코프)
 - 1) for문 내부에서는 외부에 선언된 변수에는 접근이 가능하다.
 - 2) for문 내부에서 새롭게 선언한 변수에는 외부에서 접근이 불가능하다.
======================================================**/


var sum = 0

for i in 1...10 {
    sum += i
}

print(sum)




for index in 1...5 {
    print("For문 출력해보기: \(index)")
    print(name)
    var realName = "잡스"
    print(realName)
}


//print(realName)












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

