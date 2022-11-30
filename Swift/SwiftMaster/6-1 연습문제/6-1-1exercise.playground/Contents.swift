import UIKit


/*:
 # 연습문제
 */
/*:
 ---
 * 구구단 출력해보기
 ---
 */
for i in 2...9 {
    for j in 1...9 {
        print("\(i) X \(j) = \(i*j)")
    }
}






/*:
 ---
 * 배수 구해서 출력해보기 - 3의 배수 구하기
 ---
 */
// 3으로 나누어지는 숫자 출력

for i in 1...100 {
    if i % 3 == 0 {
        print("3의 배수 발견: \(i)")
    }
}





// 가독성이 높아지는 구현

for i in 1...100 {
    if i % 3 != 0 {   // 조건을 만족하지 못했을 때 다음으로 넘어감
        continue
    }
    print("3의 배수 발견: \(i)")
}


//:> 여러 조건이 있을때, 가독성 높게 구현 가능


/*:
 ---
 * 이모티콘 출력해보기
 ---
 */
print("😄")
print("😄😄")
print("😄😄😄")
print("😄😄😄😄")
print("😄😄😄😄😄")




for _ in 1...5 {
    print("😄")
}




for i in 1...5 {
    print("😄", terminator: "")
}





for i in 1...5 {
    for j in 1...5 {
        if j <= i {
            print("😄", terminator: "")
        }
    }
    print()
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
