import UIKit



/*:
 ## 2) 계산속성(Computed Properties)
 * 계산속성이라는 것이 왜 필요할까?
 ---
 */
// 값이 저장되는 일반적인 속성(변수)을 저장 속성이라고 함
// 그동안 우리가 배운 속성은 정확한 의미에서 "저장 속성"이었음 ====> 앞으로 저장 속성이 아닌 것을 배우게 됨


/**====================================================
 - 먼저 "계산속성이 아닌 방식"으로 구현예시
=======================================================**/

// 비만도를 측정하는 체질량 지수(BMI)를 예시
// BMI = 65 / (1.65 * 1.65)    (몸무게를 키의 제곱으로 나누되, 키는 M미터 기준으로)

class Person {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    func calculateBMI() -> Double {
        let bmi = weight / (height * height) * 10000
        return bmi
    }
}


let p = Person()
p.height = 165     // 키 165
p.weight = 65      // 몸무게 65

p.calculateBMI()   // 23.875



// calculateBMI()

// BMI를 계산하는 이 산식은 파라미터가 없고,
// 내부에 가지고 있는 저장 속성값을 이용해, 계산한 후 결과값을 리턴한다.


/*:
---
* 위의 사례를 계산속성(Computed Properties)으로 바꾸어서 구현하기
---
*/
//:> 밖에서 해당 인스턴스에 접근해서 "get" ➞ 값을 얻는다는 의미

class Person1 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {                                                //get ===> 값을 얻는다는 의미
            let result = weight / (height * height) * 10000
            return result
        }
    }
}



let p1 = Person1()
p1.height = 165   // 키 165
p1.weight = 65    // 몸무게 65


p1.bmi


/**======================================================
 - 항상 다른 저장 속성에 의한 결과로 계산해 나오는 그런 방식의 메서드인 경우
 - 아예 속성처럼 만들 수 있다. (===> 계산 속성)
=========================================================**/
// 다른 속성의 계산의 결과로 나오는 속성


// 하나의 문제
// p1.bmi = 24         // get-only property (갑을 셋팅하는 것이 안되는 - 읽기 전용 계산 속성)


/*:
---
* 위의 사례를 읽기/쓰기가 가능한 계산속성으로 변경하기
---
*/
//:> 밖에서 해당 인스턴스에 접근해서 "set" ➞ 값을 세팅(설정)한다는 의미

class Person2 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {        //getter ===> 값을 얻는다는 의미
            let bmi = weight / (height * height) * 10000
            return bmi
        }
        set(bmi) {   //setter ===> 값을 세팅한다(넣는다)는 의미
            weight = bmi * height * height / 10000
        }
    }
    
    // 만약에 쓰기 계산속성(set)을 메서드로 구현했다면
//    func setWeightWithBMI(bmi: Double) {
//        weight = bmi * height * height / 10000
//    }
}


let p2 = Person2()
p2.height = 165   // 키 165
p2.weight = 65    // 몸무게 65


p2.bmi
p2.bmi = 25

p2.weight


// 메서드로 구현 부분 확인하기

//p2.setWeightWithBMI(bmi: 24)
//p2.weight




/*:
---
* 읽기만 가능한 계산속성(read-only)은 get블록을 생략 가능
---
*/
// 읽기만 가능한 계산 속성으로 구현한다면
// get블록을 생략하고, 구현할 수 있음


class Person3 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let bmi = weight / (height * height) * 10000
            return bmi
        }
    }
}


// get블록만 있다면, 굳이 한번 더 감쌀 필요가 없다. ===> 편의를 위해 get을 생략가능

/**================================================
  var bmi: Double {
      let bmi = weight / (height * height) * 10000
      return bmi
  }
================================================**/
/*:
---
* set블록의 파라미터를 생략하고 'newValue'로 대체가능
---
*/

class Person4 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let bmi = weight / (height * height) * 10000
            return bmi
        }
        set {
            weight = newValue * height * height / 10000
        }
    }
}



/*:
---
* 계산 속성(Computed Properties) 이해하기
---
*/
/**==================================================================================
 - 메서드가 아닌, 속성방식으로 구현하면 무슨 장점이 있을까?

 - 관련이 있는 두가지 메서드(함수)를 한번에 구현할 수 있다.
 - 그리고 외부에서 보기에 속성이름으로 설정가능하므로 보다 명확해 보임
 - 따라서, 계산 속성은 메서드를 개발자들이 보다 읽기 쉽고, 명확하게 쓸 수 있는 형태인 속성으로 변환해 놓은 것이다.

 - 실제로, 계산 속성은 겉모습은 속성(변수)형태를 가진 메서드(함수)임 ⭐️
 - 계산 속성은 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을때 다른 속성에 접근해서 계산한후,
   그 계산 결과를 리턴하거나 세팅하는 메서드 이다.
=====================================================================================**/



/*:
---
* 주의점
---
*/
/**=====================================================================
 - 계산 속성 ===> 구조체, 클래스, (열거형) 동일

 - 1) 항상 변하는 값이므로, var로 선언해야함 (let로 선언불가)
 - 2) 자료형 선언을 해야함(형식추론 형태 안됨) (메서드이기 때문에 파라미터, 리턴형이 필요한 개념)
 - 3) get은 반드시 선언 해야함(값을 얻는 것은 필수, 값을 set하는 것은 선택)
=======================================================================**/







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
