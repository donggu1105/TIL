import UIKit


/*:
 ## KeyValuePairs
 * 딕셔너리와 유사한 형태이지만, 배열처럼 순서가 있는 컬렉션
 ---
 */
/**========================================================
 - 스위프트 5.2 버전에 등장
 - 딕셔너리와 비슷한 형태지만, "순서"가 있는 컬렉션

 - key값이 해셔블(hashable)일 필요없음 (검색 알고리즘상 빠르지 않음)
 - key값이 동일한 것도 가능
========================================================**/


let introduce: KeyValuePairs = ["first": "Hello", "second": "My Name", "third":"is"]



/*:
 ---
 * KeyValuePairs의 기본 기능
 ---
 */
introduce.count
introduce.isEmpty


/*:
---
* 요소에 접근
---
*/
// 배열처럼, 인덱스로 접근 가능
// 요소에서는 튜플방식으로 접근


introduce[0]



//print("\(introduce[0].key)는 \(introduce[0].value) 입니다.")
//print("\(introduce[1].key)는 \(introduce[1].value) 입니다.")
//print("\(introduce[2].key)는 \(introduce[2].value) 입니다.")



/*:
 ---
 * 반복문과의 결합
 ---
 */
for value in introduce {
    print("\(value.key)는 \(value.value) 입니다.")
}



//:> append / remove 같은 기능이 없음
 
// 딕셔너리이지만, 저장된 순서가 중요할 경우, 또는 데이터가 반복될 경우만 임시적/제한적으로 사용










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
