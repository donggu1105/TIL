import UIKit


/*:
 # 연습문제
 -
 */
/*:
 ## 1) 가위 바위 보 게임 만들기
 * 가위/바위/보 어떻게 만들어야 할까?, 내가 선택한 것과 컴퓨터가 랜덤으로 선택한 것을 비교
 ---
 */
// 조건
// 1) 가위 => 0
// 2) 바위 => 1
// 3) 보  => 2


var computerChoice = Int.random(in: 0...2)
var myChoice = 2




// 그냥 출력한번 해보기

switch computerChoice {
case 0:
    print("컴퓨터의 선택은 가위 입니다.")
case 1:
    print("컴퓨터의 선택은 바위 입니다.")
case 2:
    print("컴퓨터의 선택은 보 입니다.")
default:
    break
}


switch myChoice {
case 0:
    print("당신의 선택은 가위 입니다.")
case 1:
    print("당신의 선택은 바위 입니다.")
case 2:
    print("당신의 선택은 보 입니다.")
default:
    break
}



// 로직을 짜기 전에 고민


if myChoice == 0 {      // 각 케이스 별로 다 고려
    if computerChoice == 0 {
        print("무승부 입니다.")
    } else if computerChoice == 1 {
        print("당신은 졌습니다.")
    } else {  //computerChoice == 2
        print("당신이 이겼습니다.")
    }
} else if myChoice == 1 {
    if computerChoice == 0 {
        print("당신이 이겼습니다.")
    } else if computerChoice == 1 {
        print("무승부 입니다.")
    } else {  //computerChoice == 2
        print("당신은 졌습니다.")
    }
} else {  //myChoice == 2
    if computerChoice == 0 {
        print("당신은 졌습니다.")
    } else if computerChoice == 1 {
        print("당신이 이겼습니다.")
    } else {  //computerChoice == 2
        print("무승부 입니다.")
    }
}






if myChoice == computerChoice {  // 무승부의 경우를 먼저 정의 ===> 이긴 경우 ===> 나머지
    print("무승부 입니다.")
} else if myChoice == 0 && computerChoice == 2 {
    print("당신이 이겼습니다.")
} else if myChoice == 1 && computerChoice == 0 {
    print("당신이 이겼습니다.")
} else if myChoice == 2 && computerChoice == 1 {
    print("당신이 이겼습니다.")
} else {
    print("당신은 졌습니다.")
}





/*:
---
* 열거형으로 만들 수 있음
---
*/
// 나중에 위의 구현을 활용해서, 열거형으로 구현해보기




















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
