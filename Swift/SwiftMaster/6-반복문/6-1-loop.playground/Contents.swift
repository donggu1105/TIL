import UIKit

/*:
 # Part6 - Loops (반복문)
 */
/*:
 ---
 * 반복문의 종류
 ---
 */
/**====================
- 1) For 반복문
- 2) While 반복문
     (1) while
     (2) repeat-while
=======================**/


/*:
## 1) for문
 * For문의 기본 형태
 ---
 */
//스위프트 스타일의 문법은 직관적이고 쉽게 작성이 가능하도록 되어있음

for index in 1...5 {        //let index = 1, let index = 2, let index = 3, let index = 4, let index = 5
    print("For문 출력해보기: \(index)")
}




for index in 1...4 {
    print("\(index)에 5를 곱하면 \(index * 5)")
}




// 참고 >
// C언어/Java 스타일의 for 문 ====> 다른 언어들에 비해 엄청 읽기 쉽고 간결한 형태로 이루어짐

//for(int i = 0; i <= 5; i++) {
//
//}




// 이런 방식으로 많이 활용

var number = 10


for i in 1...number {
    print(i)
}




/*:
 ---
 * 참고) 와일드 카드 패턴
 ---
 */
//:> 와일드 카드 패턴 _ (언더바)은 스위프트에서 생략의 의미!

for _ in 0...10 {
    print("hello")
}



let _ = "문자열"


(1...10).reversed()



let a = (1...10).reversed()

print(a)


/*:
 ---
 * 배열 등 컬렉션 타입에서도 사용 가능
 ---
 */
// 컬렉션에서 각 아이템을 차례 차례 한번씩 뽑아서 중괄호 안에서 사용

let list = ["Swift", "Programming", "Language"]


for str in list {
    print(str)
}


// 뒤에서 배열 먼저 공부하고 와서 다시 보기




/*:
 ---
 * 문자열에서도 사용 가능
 ---
 */
// 문자열에서 각 문자를 차례 차례 한개씩 뽑아서 중괄호 안에서 사용

for chr in "Hello" {
    print(chr)
    //print(chr, terminator: " ")     //다음줄로 넘어가지 말고, 한칸을 띄워라
}




/*:
 ---
 * 특정한 함수 활용 가능
 ---
 */
// 역순으로 바꾸기

for number in (1...5).reversed() {
    print(number)
}




//홀수 또는 홀수만 뽑아내기

for number in stride(from: 1, to: 15, by:2) {     //마지막 숫자는 포함하지 않음
    print(number)
}




//:> stride: 성큼성큼 걷다.


let range = stride(from: 1, to: 15, by: 2)     //  StrideTo<Int>
print(range)
// 1, 3, 5, 7, 9, 11, 13

for i in range {
    print(i)
}


let range1 = stride(from: 1, through: 15, by: 2)     // StrideThrough<Int>
print(range1)
// 1, 3, 5, 7, 9, 11, 13, 15

for i in range1 {
    print(i)
}



let range2 = stride(from: 10, through: 2, by: -2)      //   StrideThrough<Int>
print(range2)
// 10, 8, 6, 4, 2


for i in range2 {
    print(i)
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
