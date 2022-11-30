import UIKit


/*:
 # Part10 - 열거형
 */
/*:
 ## 열거형(Enumerations)
 * 연관된 상수(케이스)들을 하나의 이름으로 묶은 자료형
 ---
 */
// 케이스가 선택가능한(한정됨) 가짓 수로 정해져 있을때 정의

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}


enum CompassPoint {
    case north, south, east, west
}


/*:
 ---
 * 언제 열거형을 사용하는가?
 ---
 */
/**=====================================
 [한정된 사례(정해진 갯수) 안에서 정의할 수 있을때]
 
 - 월 / 화 / 수 / 목 / 금 / 토 / 일
 - 동 / 서 / 남 / 북
 - 좌로 정렬 / 가운데 정렬 / 우측 정렬
 - 초등학교 / 중학교 / 고등학교 / 대학교
 - 남 / 여
 - 가위 / 바위 / 보
 ======================================**/


// 열거형을 사용하면 코드의 가독성과 안정성이 높아짐 ===> 명확한 분기 처리 가능


/*:
 ---
 * 열거형 타입
 ---
 */
//:> 열거형은 타입이다!

var today: Weekday = Weekday.monday

today = .tuesday




// 일요일인 경우만 특정한 처리를 하고 싶을때

if today == .sunday {
    
}


// 모든 각각의 경우를 처리하고 싶을때

if today == .monday {
    print("오늘은 월요일입니다.")
} else if today == .tuesday {
    print("오늘은 화요일입니다.")
} else if today == .wednesday{
    print("오늘은 수요일입니다.")
} else if today == .thursday{
    print("오늘은 목요일입니다.")
} else if today == .friday{
    print("오늘은 금요일입니다.")
} else if today == .saturday{
    print("오늘은 토요일입니다.")
} else {
    print("오늘은 일요일입니다.")
}



//:> 열거형은 항상 switch문으로 분기처리 가능

switch today {
case .monday:
    print("오늘은 월요일입니다.")
case .tuesday:
    print("오늘은 화요일입니다.")
case .wednesday:
    print("오늘은 수요일입니다.")
case .thursday:
    print("오늘은 목요일입니다.")
case .friday:
    print("오늘은 금요일입니다.")
case .saturday:
    print("오늘은 토요일입니다.")
case .sunday:
    print("오늘은 일요일입니다.")
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
