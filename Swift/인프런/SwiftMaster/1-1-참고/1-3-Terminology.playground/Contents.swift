import UIKit


/*:
# 참고) 프로그래밍 관련 용어 정리
*/
/*:
## 1) 키워드(Keyword)
* 약속어 (스위프트에서 특별한 의미로 사용하겠다고 미리 정해놓은 단어)
---
*/

//var
//let
//if
//true



/*:
## 2) 리터럴(Literals)
* 코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체(Int / Double / String / Character / Bool 리터럴 등)
---
*/

var a = 4    // "오른쪽에는 정수 4를 넣었다."라고 할 수도 있지만, "오른쪽에는 할당하기 위해 <정수 리터럴>값인 정수4를 넣었다."

var b: Int = 8


var name = "홍길동"      // "문자열 리터럴" 값을 넣어야해.

var double = 3.14      //  "더블 리터럴" 값 3.14


"안녕"

4.5





/*:
## 3) 식별자(Identifier)
* 변수, 상수, 함수, 사용자 정의 타입의 이름
---
*/

var name1 = "전지현"

let name2 = "임꺽정"






/*:
## 4) 토큰(Token)
* 코드의 가장 작은 단위: 코드에서 더이상 쪼갤 수 없는 최소의 단위 (식별자, 키워드, 구두점, 연산자, 리터럴)
---
*/

//var

//!=

//123

// 토큰은 사이에 빈칸을 추가해선 안됨. (다만, 빈칸을 없애는 것은 때때로 괜찮음)

// 프로그래밍에서는 줄바꿈/탭도 빈칸(공백)으로 인식함. 즉, 빈칸이 여러개 띄어있어도 컴퓨터가 인식하기에는 1개의 빈칸으로 봄

//var aaa = 5



/*:
## 5) 표현식(Expression)
* 값, 변수, 연산자의 조합으로 하나의 결과값으로 평가되는 코드 단위
---
*/

// 하나의 값이 나오는 코드

var n = 5   //       ====> 문 장 (할당하는 작업)

17          // 17    ====> 표현식

n           // 5     ====> 표현식

n + 7       // 12    ====> 표현식

n < 5      // false  ====> 표현식






/*:
## 6) 문장(Statement)
* 문장 또는 구문: 특정작업을 실행하는 코드 단위
---
*/


var n2 = 3    // ====> 문장

print(n)      // ====> 문장

print("안녕")  // ====> 문장



// 토큰(키워드) + 표현식(값) ====> 문장(작업을 명령)




//: > ⭐️ 문법 설명시 자주 사용할 예정. 자연스럽게 익숙해짐









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
