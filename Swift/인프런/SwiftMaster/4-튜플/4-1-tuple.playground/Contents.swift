import UIKit


/*:
 # Part 4 - 튜플
 */
/*:
 ## 1) 튜플(Tuples)
 - 2개이상의 연관된 데이터(값)를 저장하는 Compound(복합/혼합) 타입
---
*/
// 특별하게 타입이 정해져 있지 않음
// 포함될 데이터 갯수를 마음대로 정의하기 나름


let twoNumbers: (Int, Int) = (1, 2)
//type(of: twoNumbers)



let threeNumbers = (1, 2, 5)
//type(of: threeNumbers)


var threeValues = ("홍길동", 20,  "서울")      // 멤버(데이터의 종류 및 갯수)는 튜플을 만들때 결정되므로 "추가"/"삭제" 불가
//type(of: threeValues)




/*:
---
* 연관된 값(튜플)의 각각의 데이터의 접근
---
*/

threeValues.0
threeValues.1
threeValues.2





/*:
---
* Named Tuple(이름이 매겨진 튜플)
---
*/
// 일반적으로 위처럼 사용하면, 혼동할 가능성이 큼

let iOS = (language: "Swift", version: "5")


iOS.0
iOS.1

// 코드의 가독성이 높아짐

iOS.language
iOS.version



/*:
---
* 튜플의 분해(Decomposition)
---
*/
// 튜플의 데이터 묶음을 각 한개씩 분해해 상수나 변수에 저장 가능


let (first, second, third) = threeNumbers
first
second
third



// 모아놓았던 데이터를 분해해서 사용하고 싶을 경우



/*:
---
* 튜플의 값의 비교 - 실제 사용하는 경우는 흔하지는 않음
---
*/
// 두개의 튜플 비교 가능 ===> 왼쪽 멤버부터 한번에 하나씩 비교하고, 같을 경우 다음 멤버를 비교함
// 튜플은 최대 7개 요소 미만만 비교 가능(애플의 라이브러리 기능)


(1, "zebra") < (2, "apple")   // true, 1이 2보다 작고; zebra가 apple은 비교하지 않기 때문
(3, "apple") < (3, "bird")    // true 왼쪽 3이 오른쪽 3과 같고; apple은 bird보다 작기 때문
(4, "dog") == (4, "dog")




("blue", -1) < ("purple", 1)            // 비교가능, 결과: true
//("blue", false) < ("purple", true)    // 에러발생 ===> Bool 값은 비교 불가능










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
