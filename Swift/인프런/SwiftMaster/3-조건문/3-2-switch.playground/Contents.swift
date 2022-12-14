import UIKit



/*:
 ## 2) Switch문
 - 표현식/변수를 (매칭시켜) 분기처리할때 사용하는 조건문
 ---
 */
//:> if문보다 한정적인 상황에서 사용

var choice: String = "안녕하세요"


// 조건을 부등식이 아닌 "=="와만 비교
// 변수가 어떤값을 가지냐에 따라 실행문을 선택하고 진행




switch choice {   // 변수(표현식)
case "가위":       // "가위" == "가위"
    print("가위 입니다.")
case "바위":
    print("바위 입니다.")
case "보":
    print("보 입니다.")
default:
    break
}


/**=======================================================
 [스위치문의 특징]
 - 1) 스위치문에서 케이스의 ,(콤마)는 또는의 의미로 하나의 케이스에
      여러 매칭값을 넣을 수 있음
 - 2) switch 문은 (비교하고 있는)값의 가능한 모든 경우의 수를 반드시
      다루어야 함 (exhaustive: 하나도 빠뜨리는 것 없이 철저한)
      모든 사례를 다루지 않았을 때에는 디폴트 케이스가 반드시 있어야 한다.
 - 3) 각 케이스에는 문장이 최소 하나 이상 있어야 하며 만약 없다면 컴파일
      에러 발생(의도하지 않은 실수를 방지 목적)
      실행하지 않으려면, break를 반드시 입력해야함 (if문에서는 실행문을
      입력안해도 괜찮지만, 스위치문에서는 필요함)
=========================================================**/



switch choice {  // 문자열
case "가위":
    print("가위 입니다.")
case "바위", "보":
    print("바위 또는 보 입니다.")
default:
    break
}



var isTrue = true


switch isTrue {
case true:
    print("true")
case false:
    print("false")
}




/*:
 ---
 * fallthrough 키워드의 사용
 ---
 */

var num1 = 10

switch num1 {
case ..<10:
    print("1")        // 매칭된 값에 대한 고려없이 무조건 다음블럭을 실행함
    fallthrough
case 10:
    print("2")
    fallthrough
default:
    print("3")
}





/*:
 ---
 * switch문의 범위 매칭 - 패턴 매칭 연산자와 관련
 ---
 */

// ⭐️ 잘못 작성된 예시 =====================


// 비교연산자와 값을 넣으면 안되고, 비교하려는 값이 와야함

//switch temperature {
//case  < 0 :    //이런식으로 작성하면 안된다. ==>   ..<0
//    print("영하 - 0미만")
//case >= 0 && <= 18 :     //이런식으로 작성하면 안된다. ==>   0...
//    print("0이상 무덥지 않은 날씨")
//default :
//    break
//}





// 부등식을 사용될 수 없는 대신에, 범위 매칭을 지원


var num = 30



// ⭐️ 범위연산자, 패턴매칭 연산자 (참과 거짓의 결과가 나옴)

0...50 ~= num
51...100 ~= num




switch num {
case 0...50:      // 0...50 ~= 30 내부적으로 패턴매칭으로 확인
    print("숫자의 범위: 0 ~ 50")
case 51...100:
    print("숫자의 범위: 51 ~ 100")
default:
    print("그 외의 범위")
}




var temperature = 19

switch temperature {
case ..<0:
    print("영하 - 0도 미만")
case 0...18:
    print("0도 이상 무덥지 않은 날씨")
case 19...:
    print("여름 날씨")
default:
    break
}



//:> 이해보다는 여러번 안보고 직접 작성해보는 것이 중요 ⭐️








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

