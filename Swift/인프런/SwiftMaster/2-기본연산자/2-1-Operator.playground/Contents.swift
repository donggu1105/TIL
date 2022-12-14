import UIKit


/*:
 # Part2 - 기본연산자(Basic Operators)
 */
/*:
 ## 1) 연산자 기초
* 연산자 기초: 연산자란? 연산자의 종류
---
*/
/**=======================================================================
 연산자(operator)
 - 값을 검사, 바꾸거나, 또는 조합하기 위해 사용하는 특수한 ‘기호(symbol)’나 ‘구절(phrase)’임
 
 [피연산자의 갯수에 따른 연산자의 구분]
 - 1.단항연산자: 단일 대상의 바로 앞 또는 바로 뒤에 위치하는 연산자
     (예시) -a ; +b ; !a ; a... 등이 존재
 - 2.이항연산자: 두개의 대상의 가운데 위치하여 검사 및 계산. (대부분 이항연산자 형태로 사용)
     (예시) a + b ; a - b ; a >= b
 - 3.삼항영산자: 세개의 대상을 조합하여 특수한 계산을 함. (단 한가지의 삼항연산자가 존재)
     (예시) a ? b : c
==========================================================================**/


/*:
 ## 2) 기본 연산자
 * 할당 연산자(Assignment Operator)
 ---
 */
// 할당연산자: 오른쪽의 값을 왼쪽에 대입
// (왼쪽의 값을 오른쪽의 값으로 초기화 하거나 업데이트 함)
let num2 = 10
var num1 = 5
num1 = num2

 

/*:
---
* 산술 연산자(Arithmetic Operator): 사칙 연산 등 기본적으로 스위프트에 내장되어 있는 기능
---
*/
/**====================================
 [산술 (이항) 연산자]
 - + : 더하기 연산자      (단항 사용도 가능: +a)
 - - : 빼기 연산자       (단항 사용도 가능: -a)
 - * : 곱하기 연산자(별표)
 - / : 나누기 연산자(슬래시)
 - % : 모듈로(나머지) 연산자 ⭐️
=======================================**/



var a = 456
var b = 123



a + b

a - b

a * b



// ================================

b / a   // 몫 구하기(정수끼리)
    
b % a   // 나머지 구하기(정수끼리)


//:> 모듈로(%)연산자:  비전공자에게 익숙하지 않지만, 정말 많이 사용하는 개념 ⭐️



/*:
---
* 모듈로(%)의 사용 (🔸 Int 일때만 사용) ➞ 주로 사용하는 패턴의 예시
---
*/
// 1) 첫번째 패턴

var yourWatchingTime: Int = 70  // 70분, ====> (예) 1시간 10분


var hour = yourWatchingTime / 60
var minute = yourWatchingTime % 60


print("당신은 \(yourWatchingTime)분. 즉, 총 \(hour) 시간 \(minute) 분을 시청 하셨습니다.")





// 2) 두번째 패턴 (감만 익히기)

var num = 100

var array = ["1", "2", "3"]        // 배열이라는 것 (뒤에서 자세히 배움)

array[0]

array[num % 3]




/*:
---
* 나누기 사용은 항상 주의
---
*/
//:> 프로그래밍에서 나누기 사용은 항상 주의 (한번 더 생각!)
a = 4
b = 5


var newResult: Double

//newResult = a / b

newResult = Double(a / b)

newResult = Double(a) / Double(b)






/*:
---
* 사칙연산 및 모듈로 사용 연습
---
*/

let a1 = 6
let b1 = 2
var result: Int

result = a1 + b1
print(result)

result = a1 - b1
print(result)

result = a1 * b1
print(result)

result = a1 / b1
print(result)

result = a1 % b1
print(result)




/*:
---
* 복합 할당 연산자(Compound Assignment Operators)
---
*/
var value = 0


//value = value + 10
value += 10


//value = value - 5
value -= 5


//value = value * 2
value *= 2


//value = value / 2
value /= 2


//value = value % 2
value %= 2



//value++    //다른 언어에서 1을 증가시키는 방법(스위프트에서 지원하지 않음)


//스위프트에서의 올바른 방식
value += 1




/*:
---
* 비교연산자(Comparison Operators): 결과적으로 문장의 평가값은 참/거짓으로 도출
---
*/

a = 456
b = 123

// 같다(Equal to operator)
a == b

// 같지 않다(Not equal to operator)
a != b

// 크다(Greater than operator)
a > b

// 크거나 같다(Greater than or equal to operator)
a >= b

// 작다(Less than operator)
a < b

// 작거나 같다(Less than or equal to operator)
a <= b




var c = (b == 123)



// if문 하고 결합되어서 주로 사용




/*:
---
* 논리 연산자(Logical Operators)
---
*/
// ⭐️ Logical NOT Operator
!true
!false


// Logical AND Operator(앤드, 그리고)
true && true
true && false
false && true
false && false


// Logical OR Operator(또는)
true || true
true || false
false || true
false || false




// 아이디도 6자리 이상이고, 비밀번호도 6자리 이상이다.


// 하다보면 자연스럽게 이해하게 됨 ===> 스트레스 받지 마세요.



// ! 상당히 많이 사용함 (앱을 만들때 직접 많이 써보면서 익숙해 질 것임)

c = !true





/*:
---
* 연산(계산)의 우선순위(Precedence) 지정 / 기본적으로 곱하기 우선
---
*/

1 + 2 * 3 + 3
1 * (2 - 3)


/**===================================
 연산의 우선순위
 - 1. * /              곱하기/나누기
 - 2. + -              더하기/빼기
 - 3. <=  >  ==  !=    비교
 - 4. &&  ||           논리
 - 5. 삼항연산자
 - 6. = +=             할당, 복합할당
 ===================================*/



// 연산의 우선 순위 참고
// https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations




//:> 연산자에는 더 깊은 여러가지 개념이 있으나, 심화(Advanced Operators)에서 다룰예정




/*:
 ## 2) 접근연산자
* 접근연산자 - (.)점
---
*/
// 접근 연산자라고 불리는, .(점)은 어떤 의미일까?



Int.random(in: 1...3)

var number = Int.random(in: 1...5)



var name = "스티브"


print(name.count)








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
