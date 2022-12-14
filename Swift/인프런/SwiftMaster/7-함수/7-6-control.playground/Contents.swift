import UIKit

/*:
# 제어전송문 정리
*/
/*:
## 1) break
 * (1) switch문   (2) 반복문(for/while 등) 에서 사용
---
*/

var a = 3

switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
case 4:
    print("안녕하세요")
default:
    break
}



// 가장 인접한 반복문을 아예 중지 ⭐️

for index in 1...10 {

    if index == 3 {
        break
    }

    print(index)
}



/*:
## 2) fallthrough
* switch문에서 사용
---
*/

switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
    fallthrough
case 4:
    print("안녕하세요")
default:
    break
}


// 3입니다.
// 안녕하세요


/*:
## 3) continue
* 반복문에서 사용(for/ while 등)
---
*/
// continue는 반복문을 다음 싸이클로 보냄
// 다음 싸이클에서 계속 지속(continue)하라는 의미


for index in 1...10 {

    if index % 2 != 0 {
        continue
    }

    print(index)
}



/*:
## 4) return
* 함수에서 사용
---
*/

func doSomething() {
    print("1")
    print("2")
    
    if true {
        return
    }
    
    print("3")
    print("4")
}


doSomething()



/*:
## 5) throw
* (에러가 발생할 수 있는) throwing 함수에서 사용
---
*/
// 향후 Error Handling 부분을 배운 후, 복습

enum APIError: Error {
    case aError
    case bError
}



func doSomething2() throws -> String {
    print("1")
    print("2")
    
    if true {
        throw APIError.aError    // 리턴과 동일한 역할(함수를 종료시킴) ===> 에러를 던지고 함수를 벗어남
    }
    
    print("3")
    print("4")
    
    return "안녕하세요"
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
