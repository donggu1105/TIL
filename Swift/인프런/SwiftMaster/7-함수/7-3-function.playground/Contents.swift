import UIKit


/*:
## 함수 사용시 주의점 ⭐️
* 1) 함수의 파라미터에 대한 정확한 이해
---
*/
// 함수의 파라미터

func someAdd(a: Int) -> Int {            // let a: Int   (값의 변경이 불가능)
    //a = a + 1
    return a
}



someAdd(a: 5)



/*:
---
* 2) 함수 내의 변수의 Scope(스코프)
---
*/
//:> 함수 내에서 선언한 변수의 Scope(범위) ➞ 함수의 바디로 제한됨
// 뒤쪽에서 메모리구조를 보면 명확하게 직관적으로 이해 가능


func sumOfNum(a: Int) -> Int {
    var sum = 0
    sum += a
    return sum
}

//sum


sumOfNum(a: 3)



/*:
---
* 3) return 키워드의 정확한 이해
---
*/
/**==============================================================
 - return 키워드의 역할
 - 1) 리턴타입이 있는 함수의 경우(아웃풋이 있는 경우):
      리턴 키워드 다음의 표현식을 평가한 다음에 그 결과를 리턴하면서 함수를 벗어남
 - 2) 리턴타입이 없는 함수의 경우(아웃풋이 없는 경우):
      함수의 실행을 중지하고 함수를 벗어남 ⭐️
=================================================================**/


// 리턴 타입이 있는 경우

func addFunction(num1: Int, num2: Int) -> Int {
    var result = num1 + num2
    return result
}



addFunction(num1: 3, num2: 4)




// 리턴 타입이 있는 경우

func valuationFunction(num: Int) -> Int {
    
    if num >= 5 {
        return num
    }

    return 0
}



valuationFunction(num: 3)

valuationFunction(num: 5)




// 리턴 타입이 없는 경우

func numberPrint(n num: Int) {
    
    if num >= 5 {
        print("숫자가 5이상입니다.")
        return
    }
    
    print("숫자가 5미만입니다.")
}


numberPrint(n: 7)

numberPrint(n: 4)

numberPrint(n: 5)




/*:
---
* 4) 리턴타입이 있는 경우, 함수의 실행문의 의미
---
*/
//리턴 타입이 있는 함수를 호출하는 경우, 함수를 호출하는 것은 표현식 (표현식의 결과는 함수가 리턴하는 값)


func nameString() -> String {
    return "스티브"
}


var yourName: String = nameString()           // "스티브"




if nameString() == "스티브" {
    print("이름이 일치합니다.")
}




//var your: () -> String = nameString




/*:
---
* 5) 함수의 중첩 사용 - 중첩된 함수(Nested Functions)
---
*/
// 함수 안에 함수를 작성할 수도 있다.
// (함수 안에 있는 함수는 밖에서 사용이 불가능)


// 함수를 제한적으로 사용하고 싶을 때, 사용

func chooseStepFunction(backward: Bool, value: Int) -> Int {
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    
    if backward {
        return stepBackward(input: value)
    } else {
        return stepForward(input: value)
    }
    
}






var value = 7

//case1
chooseStepFunction(backward: true, value: value)


//case2
chooseStepFunction(backward: false, value: value)










/*:
## 함수 표기법(지칭), 함수의 타입 표기
* 참고) 함수 표기법
---
*/
// 정의문
func doSomething() {
    print("출력")
}



func addPrintFunction(_ firstNum: Int, _ secondNum: Int) {
    print(firstNum + secondNum)
}




// 실행문

numberPrint(n: 3)



/**=============================================
 - 함수를 지칭하려는 경우, 함수를 어떻게 표기할까?
 - 1) 개발자 문서를 읽을 때 필요
 - 2) 함수를 지칭할때 필요(함수를 변수에 담거나)
================================================**/


// 함수의 표기법(함수를 지칭시)

// 1) 파라미터가 없는 경우, ()를 삭제

doSomething



// 2) 아규먼트 레이블이 있는 경우, 아규먼트 레이블까지를 함수의 이름으로 봄

numberPrint(n:)        //  "numberPrint n 함수이다."



// 3) 파라미터가 여러개인 경우, 콤마없이 아규먼트이름과 콜론을 표기

chooseStepFunction(backward:value:)



// 4) 아규먼트 레이블이 생략된 경우, 아래와 같이 표기

addPrintFunction(_:_:)




/*:
---
* 함수 타입의 표기
---
*/
// 변수에 정수를 저장하는 경우에 타입 표기

var num: Int = 5




// 함수의 타입 표기 방법

var function1: (Int) -> () = numberPrint(n:)


var function2: (Int, Int) -> () = addPrintFunction(_:_:)



// 변수가 함수를 가르키도록 할 수 있음

function2(3, 5)









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
