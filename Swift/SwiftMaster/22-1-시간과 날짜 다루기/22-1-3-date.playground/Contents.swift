import UIKit

//:> 생각나지않으면, 필요할때 찾아쓰면 됨 (외우는 것 절대 아님)

/*:
 ## DateFormatter
* 날짜와 시간을 원하는 형식의 문자열(String)으로 변환하는 방법을 제공하는 클래스
* RFC 3339 표준으로 작성 (스위프트가 아닌 다른 표준을 사용)
---
*/
//:> Date를 특정형식의 문자열로 변환하려면 ➞ (1)지역설정 + (2)시간대설정 + (3)날짜형식 + (4)시간형식

// 날짜 + 시간  <======>  String
let formatter = DateFormatter()


// 지역 및 시간대 설정

/**==========================================
 (1) 지역 설정
============================================**/

// 나라 / 지역마다 날짜와 시간을 표시하는 형식과 언어가 다름
//formatter.locale = Locale(identifier: "ko_KR")
// "2021년 5월 8일 토요일 오후 11시 44분 24초 대한민국 표준시"

formatter.locale = Locale(identifier: "en_US")
// "Saturday, May 8, 2021 at 11:45:51 PM Korean Standard Time"



/**==========================================
 (2) 시간대 설정(기본설정이 있긴 하지만)
============================================**/

formatter.timeZone = TimeZone.current






//:> 표시하려는 날짜와 시간 설정
/**==========================================
  1) (애플이 미리 만들어 놓은) 기존 형식으로 생성
============================================**/
 
// (1) 날짜 형식 선택
formatter.dateStyle = .full           // "Tuesday, April 13, 2021"
//formatter.dateStyle = .long         // "April 13, 2021"
//formatter.dateStyle = .medium       // "Apr 13, 2021"
//formatter.dateStyle = .none         // (날짜 없어짐)
//formatter.dateStyle = .short        // "4/13/21"


// (2) 시간 형식 선택
formatter.timeStyle = .full           // "2:53:12 PM Korean Standard Time"
//formatter.timeStyle = .long         // "2:54:52 PM GMT+9"
//formatter.timeStyle = .medium       // "2:55:12 PM"
//formatter.timeStyle = .none         // (시간 없어짐)
//formatter.timeStyle = .short        // "2:55 PM"


// 실제 변환하기 (날짜 + 시간) ===> 원하는 형식
let someString1 = formatter.string(from: Date())
print(someString1)





/**==========================================
  2) 커스텀 형식으로 생성
============================================**/

//formatter.locale = Locale(identifier: "ko_KR")
//formatter.dateFormat = "yyyy/MM/dd"
formatter.dateFormat = "yyyy년 MMMM d일 (E)"


let someString2 = formatter.string(from: Date())
print(someString2)


// 문자열로 만드는 메서드
//formatter.string(from: <#T##Date#>)
 



/**==============================================================================================
 - 날짜/시간 형식: http://www.unicode.org/reports/tr35/tr35-25.html#Date_Format_Patterns (유니코드에서 지정)
 ===============================================================================================**/




/*:
---
* 반대로, (형식)문자열에서 Date로 변환하는 것도 가능
---
*/

let newFormatter = DateFormatter()
newFormatter.dateFormat = "yyyy/MM/dd"


let someDate = newFormatter.date(from: "2021/07/12")!
print(someDate)



/*:
---
* 두 날짜 범위 출력 코드 구현 (두 날짜 사이의 일수를 구하려는 것 아님)
---
*/

let start = Date()
let end = start.addingTimeInterval(3600 * 24 * 60)


let formatter2 = DateFormatter()
formatter2.locale = Locale(identifier: "ko_KR")
formatter2.timeZone = TimeZone.current
//formatter2.timeZone = TimeZone(identifier: "Asia/Seoul")

formatter2.dateStyle = .long
formatter2.timeStyle = .none


print("기간: \(formatter2.string(from: start)) - \(formatter2.string(from: end))")





/*:
---
* 프로젝트에서 활용 예시
---
*/
struct InstagramPost {
    let title: String = "제목"
    let description: String = "내용설명"
    
    private let date: Date = Date()  // 게시물 생성을 현재날짜로
    
    // 날짜를 문자열 형태로 바꿔서 리턴하는 계산 속성
    var dateString: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            //formatter.locale = Locale(identifier: Locale.autoupdatingCurrent.identifier)
            
            // 애플이 만들어 놓은
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
            
            // 개발자가 직접 설정한
            //formatter.dateFormat = "yyyy/MM/dd"
            
            return formatter.string(from: date)
        }
    }
}



let post1 = InstagramPost()
print(post1.dateString)





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
