import UIKit

/*:
 # 제어전송문
 - 반복문에서 쓰이는 제어전송문(Control Transfer Statement)
 */
/*:
 ## 1) continue
 * continue의 사용
 ---
 */

for num in 1...20 {
    if num % 2 == 0 {   // num 2의 배수
        continue
    }
    print(num)
}





/*:
 ## 2) break
 * break의 사용
 ---
 */

for num in 1...20 {
    if num % 2 == 0 {
        break
    }
    print(num)
}




/*:
---
* 주의할점 - 중첩 사용시의 적용 범위
---
*/

for i in 0...3 {
    print("OUTER \(i)")
    for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue
            //break
        }
        print("  INNER \(j)")
    }
}


//:> 가장 인접한 범위의 반복문에 영향을 미침



/*:
 ## 3) Labeled Statements
 */
/*:
 ---
 * 레이블이 매겨진 문장(Labeled Statements)과 continue, break의 사용
 ---
 */
// 반복문을 중첩적으로 사용할때, 각 반복문에 이름을 붙여서, 가장 인접한 범위 이외의 반복문도 제어가능


OUTER: for i in 0...3 {
    print("OUTER \(i)")
    INNER: for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue OUTER
            //break OUTER
        }
        print("  INNER \(j)")
    }
    
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
