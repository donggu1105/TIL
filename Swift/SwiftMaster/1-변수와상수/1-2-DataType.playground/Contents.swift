import UIKit


/*:
## 변수 선언의 정식 문법
* 변수의 선언과 저장
---
*/

var a: Int = 3     // 변수를 선언하면서 저장      (메모리 공간을 먼저 생성하는 동시에 데이터를 저장)





/*:
# 스위프트의 데이터타입(Data Types)
*/
/*:
## 1) 데이터 타입(Data Types)의 이해
* 타입이 왜 필요할까?
---
*/
// 타입(Type) ?
// 컴퓨터는 사람의 뇌와 다르다.

//:> 데이터를 얼마 만큼의 크기, 그리고 어떤 형태로 저장할 것인지에 대해 약속이 필요


var i: Int = 4
var j: Int = 3


//i = 3.4       // 소수점 타입 할당이 안됨


var k = i + j
print(k)



// 타입은 메모리 공간의 크기와 연관이 있다.




/*:
---
* 스위프트(Swift)의 데이터 타입
---
*/
/**============================================================
Swift에서 사용하는 데이터타입
- 1) Int: 정수(Integer) 🔸
- 2) Float: 실수(부동소수점) Floating-point Number  6자리 소수점
- 3) Double: 실수(부동소수점) 15자리 소수점 🔸
- 4) Character: 문자(글자 한개)
- 5) String: 문자열 🔸
- 6) Bool: 참과 거짓 🔸

- 7) 기타: UInt, UInt64, UInt32, UInt16, UInt8:  0, 그리고 양의 정수
===============================================================**/


// Int : ... -5 -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 ...
// Double: ... -3.145673, ... ,-2.2315, ... , 0 , ... , 0.453255, ..., 7.45678, ...


var b: Int = 7

var c: Double = 3



let chr: Character = "1"
type(of: chr)           // 타입을 확인하는 방법



//let chr2: Character = "aa"


let chr3: Character = " "      // 빈문자는 에러발생 그러나 공백문자는 가능


let str: String = ""   // 빈문자열 저장가능


let str1: String = "안녕하세요"





/*:
## 2) 타입 주석(Type Annotation)
* 변수를 선언하면서, 타입도 명확하게 지정하는 방식
---
*/

var number: Int      //  1) 변수를 선언 (타입 선언)     (메모리 공간을 먼저 생성하고,
number = 10          //  2) 값을 저장 (초기화)          데이터를 저장)

print(number)        //  3) 값을 읽기





// 자료형을 명확하게 지정

var a1: Int = 3
var b1: Int = 4




// 타입 선언과 초기화

var value: Double = 5.345

value = 12.3    //값 바꾸기


var value2 = value






/*:
## 3) 타입 추론(Type Inference)
* 타입을 지정하지 않아도, 컴파일러가 타입을 유추해서 (알아서 알맞는 타입으로 저장하는) 방식
---
*/
// 값을 보고, 어떤 타입인지를 컴파일러가 추론해서 사용함

var name = "홍길동"
type(of: name)



var num1 = 2
var num2 = 1.2
var num3: String = "Hello"
var num4 = true


type(of: num1)







/*:
## 4) 타입 안정성(Type Safety)
* 스위프트는 데이터 타입을 명확하게 구분하여 사용하는 언어
---
*/
//:> 스위프트는 다른 타입끼리 계산할 수 없다.

let num5 = 7
//let num6: Double = num5   //호환되지 않음(메모리 공간의 크기가 다름)



let d = 12
let e = 3.14

//let result = d + e   //정상적인 계산 불가능





//  소수 + 정수를 더 할 수 없다.
// "안녕" + 5 를 더할 수 없다.







/*:
## 5) 타입(형) 변환(Type Conversion)
* 타입을 변환해서 사용할 수 있는 방법은 있다!
---
*/

//기존에 메모리에 저장된 값을 다른 형식으로 바꿔서, 새로운 값을 생성해서 다른 메모리 공간에 다시 저장


let str2 = "123"
let number1 = Int(str2)

print(number1)






let str3 = "123.4"
let number2 = Int(str3)           // 타입컨버전이 실패했을 때 ====> nil(값이 없음)이 리턴될 수 있다.

print(number2)


     

let n = 2
let n2 = Double(n)

print(n2)





let n3: Int = Int(2.4)
print(n3)












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
