import UIKit

/*:
 # Part8 - Optionals(옵셔널)
 */
/*:
---
* 타입의 기본 개념에 대한 이해
---
*/
// 스위프트는 왜 옵셔널이라는 개념을 도입했을까?
// 모든 프로그래밍에서 아래와 같은 상황은 항상 골치거리임


var yourName: String        // 선언
//yourName = "홍길동"           // 값을 저장하지 않는다면..

print(yourName)   // (만약 저장과정이 없다면) 메모리에 저장된 값이 없는데 접근 ===> 🔸"에러"




/*:
---
* 타입(Type)
---
*/
// 지금까지의 타입 선언

let name: String = "Jobs"        // 명시적
let newName = "Musk"             // 암시적
var myAge = 20                   // 암시적
let myGrade: Double = 3.54       // 명시적


/*:
---
* 옵셔널 타입(Optional Type)
---
*/
// 모든 타입의 뒤에 ? 물음표를 붙이면 옵셔널 타입이 된다.

var num: Int? = 3
var yourAge: Int? = nil
var yourGrade: Double? = nil
var name1: String? = "Jobs"



num = nil
name1 = nil


// 값이 없어도 되는 타입으로 선언 했기 때문에, 값이 없어도 괜찮음


//:> nil - 값이 없음을 나타내는 키워드 (실제 값이 없음이 아님)


/*:
---
* 옵셔널, 옵셔널 타입의 기본 개념에 대한 이해
---
*/

// 메모리 공간에 "임시적인 타입"을 넣어놓으면 어떨까?


var optionalName: String?
//optionalName = "홍길동"


print(optionalName)   // 에러가 나지 않음 (옵셔널은 값이 없다는 것을 나타내는 키워드)



/**=========================================
- 옵셔널 타입 선언의 기본 규칙
- 1) nil 대입 가능
- 2) 자동 초기화 (값을 넣지 않을 시에 nil로 초기화) ⭐️
============================================**/




/*:
---
* 정식문법 표기
---
*/

let num1: Int? = 2             // 간편표기
let num2: Optional<Int> = 0    // 정식문법




/*:
---
* 옵셔널 타입 연습
---
*/
//var optionalNum = nil         // 불가능한 형태

var optionalNum: Int? = nil     // (추론할 형식이 없기 때문에 반드시 타입 어노테이션으로 초기화해야됨)
optionalNum = 10

// 값이 없을 수도 있는 (임시적인)타입이야


print(optionalNum)      // Optional(10)





let str: String = "Swift"
var optionalStr: String? = nil      //옵셔널 스트링 타입 ====> (값이 없을 수도 있는 타입이다)




var a: Int? = 7  // 옵셔널 인트
var b = a        // 값을 복사해서 담는 다면 타입은?

print(b)




var c: Int = 5
b = c     // Int를 Int?타입에 담을 수는 있다. (어쨌든 타입이 Int? 타입으로 바뀌어서 담김)

print(b)




/*:
---
* 옵셔널 타입끼리의 연산은 불가능
---
*/
//:> 옵셔널 타입끼리의 계산은 당연히 불가능

var numA: Int? = 3
var numB: Int? = 7



//print(numA + numB)











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
