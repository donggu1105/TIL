import UIKit

/*:
 ## 2) 기타 고차함수
 * 4 - forEach함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 활용해서
   각 아이템별로 특정 작업(작업 방식은 클로저가 제공)을 실행
 - (각 아이템을 활용해서 각각 특정 작업을 실행할때 사용)
 ======================================================**/


let immutableArray = [1, 2, 3, 4, 5]


immutableArray.forEach { num in
    print(num)
}

immutableArray.forEach { print("숫자: \($0)") }





/*:
 ---
 * 5 - compactMap함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 새롭게 매핑해서(매핑방식은 클로저가 제공)
   변형하되, 옵셔널 요소는 제거하고, 새로운 배열을 리턴
 - (map + 옵셔널제거)
 - 옵셔널은 빼고, 컴팩트(compact)하게
 - (옵셔널 바인딩의 기능까지 내장)
 ======================================================**/


let stringArray: [String?] = ["A", nil, "B", nil, "C"]


var newStringArray = stringArray.compactMap { $0 }
print(newStringArray)



let numbers = [-2, -1, 0, 1, 2]


var positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }

print(positiveNumbers)

// 사실 이런 경우는 filter로 가능
//numbers.filter { $0 >= 0 }



// compactMap은 아래와 같은 방식으로도 구현 가능

newStringArray = stringArray.filter { $0 != nil }.map { $0! }
print(newStringArray)





/*:
 ---
 * 6 - flatMap함수
 ---
 */
/**====================================================
 - 중첩된 배열의 각 배열을 새롭게 매핑해서(매핑방식은 클로저가 제공)
 - 내부 중첩된 배열을 제거하고 리턴
 - (중첩배열을 flat하게 매핑)
 ======================================================**/


var nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

print(nestedArray.flatMap { $0 })






var newNnestedArray = [[[1,2,3], [4,5,6], [7, 8, 9]], [[10, 11], [12, 13, 14]]]

var numbersArray = newNnestedArray
                            .flatMap { $0 }
                            .flatMap { $0 }

print(numbersArray)







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
