import UIKit


/*:
 ## 2) 범위 연산자(Range Operators)
 * 범위연산자: 스위프트에서 숫자의 범위를 간편하게 표시할때 사용
 ---
 */
/**===================================================
// 아래의 숫자와 위의 숫자까지의 범위를 포함

// 자체가 특별한 타입으로 정의되어있고, 의미하긴 하지만
// 일반적으로 위와 같이 타입을 정의해서 사용하는 경우는 드물고,
// 1) 반복문(for문)    2) 배열    3) switch문
// 에서만 주로 활용하므로 위의 경우에 활용 방식을 이해하는 것이 더 중요

// 주의점>
// 내림차순 형식으로 표기 불가능  12...0
// 실수형식의 범위 표기도 가능하지만 사용하는 경우는 드뭄
=====================================================**/


let numbers = 1 ... 10

/*:
 ---
 * 1) Closed Range Operator(닫힌 범위연산자), One-Sided Ranges의 표기
 ---
 */

let range = 1 ... 10     //ClosedRange<Int>

let range1 = 1...      //PartialRangeFrom<Int>

let range2 =  ...10    //PartialRangeThrough<Int>


// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함


/*:
 ---
 * 2) Half-Open Range Operator(반 개방 범위연산자), One-Sided Ranges의 표기
 ---
 */
let rangeH = 1 ..< 10     //Range<Int>

let rangeH1 =  ..<10    //PartialRangeUpTo<Int>


// One-Sided 표기시에는 숫자와 범위연산자를 붙여서 써야함






/*:
 ## 범위 연산자의 활용
 * 1) for문과 함께 사용
 ---
 */

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}



let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count



for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}



for name in names[...2] {
    print(name)
}

/*:
 ---
 * 2) 배열의 서브스크립트 문법과 함께 사용
 ---
 */

names[...2]

names[..<1]



/*:
 ---
 * 3) switch문의 케이스에서 사용
 ---
 */
var num = 23

switch num {
case 10...19:
    print("10대 입니다.")
case 20...29:
    print("20대 입니다.")
case 30...39:
    print("30대 입니다.")
default:
    print("그 외의 범위 입니다.")
}



let point = (1, 2)

switch point {
case (0, 0):
    print("(0, 0)은 원점 위에 있다.")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1))은 원점의 주위에 있다.")
default:
    print("점은 (\(point.0), \(point.1))에 위치한다.")
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
