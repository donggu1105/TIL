import UIKit


/*:
# Part1 - 변수와 상수
*/
/*:
## 1) 변수(Variables)
* 변수의 의미
---
*/
//:> 프로그램 동작의 첫번째 단계 ➞ 메모리에 값(데이터)을 저장 (변수)

var a = 3     // 변수를 선언하면서 저장
var b = 7


//b = 9
//b = b + 2
//
//var c = a + b


print(a + b)
//print(c)



// 변수를 여러개 한꺼번에 선언하는 방법: ,(콤마)로 연결

var x = 1, y = 2, z = 3



// 새로운 공간을 만들고 값을 복사(Copy)해서 저장

var newRoom = b



/*:
---
* 변수의 이름 / 이름 짓기 규칙
---
*/
var nameOfYou = "임꺽정"

var realName = "쾌걸조로"


// 변수의 이름은 소문자로시작(대문자로 시작하는 것은 권장하지 않음), 중간에 숫자들어가는 것은 Ok. (숫자를 첫글자로 시작하는 것은 금지)



var π = 3.1415926
var 你好 = "你好世界"
var 🐶🐮 = "dogcow"
var 변수 = "안녕하세요"


// 특수문자, 한자, 한글 등 사용가능 하지만, 관습적으로 잘 사용하지는 않음




var number1 = 5
var number2 = 7
var number3 = number1 + number2


number3


print(number3)




/*:
---
* 변수는 실제 어떻게 사용될까?
---
*/

var name = "홍길동"
var age = 20
var address = "서울 강남구"




//print(name, age)
//print(name, age, address)


name = "전지현"


print(name, age)


//print("저의 이름은 \(name)입니다.")

age = 30


// 사용 예시
print("저의 이름은 \(name)입니다. 저의 나이는 \(age)살 입니다. 그리고 \(address)에 살고 있습니다.")





//:> String Interpolation(스트링 인터폴레이션): 문자열 보간법
// "\(삽입할변수)" ➡︎ 문자열 중간에 삽입할때 사용





/*:
## 2) 상수(Constants)
* 상수의 의미 (변하지 않는 데이터)
---
*/
let name3 = "강동현"


let name2 = "김철수"

name2
//name2 = "이나영"



print(name2)




// 변수와 상수를 통틀어, 변수(저장된 데이터라는 관점에서)라고 일반적으로 부르기도 함











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
