import UIKit


/*:
 # 연습문제
 */
/*:
 1) 랜덤 문자열 뽑아내는 함수
 * 문자열을 입력하면 그중 한개의 글자를 랜덤으로 뽑아주는 함수를 만들어 보자!
 ---
 */
// "안녕하세요"  ===> "녕"

func chooseRandomString(_ chars: String) -> String {
    return String(chars.randomElement()!)
}




chooseRandomString("안녕하세요")





/*:
 2) 소수를 판별하는 함수
 * 소수, 즉, 1과 자기 자신만으로 나누어 떨어지는 1보다 큰 양의 정수를 판별하는 함수를 만들어 보기
 ---
 */
// 소수판별을 for문으로 구현하기

var num = 97

var isPrime: Bool = true   // 깃발


for i in 2..<num {
    
    if num % i == 0 {
        isPrime = false
        break
    }
}


if isPrime {
    print("소수입니다.")
} else {
    print("소수가 아닙니다.")
}







// 소수 여부를 알려주는 함수 ==========================

func primeNumberCheck(num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}



if primeNumberCheck(num: 7) {
    print("소수입니다.")
} else {
    print("소수가 아닙니다.")
}




// 소수를 판별해서 프린트까지 해주는 함수 =================

func primeNumber(num: Int) {
    for i in 2..<num {
        if num % i == 0 {
            print("소수가 아닙니다.")
            return
        }
    }
    print("소수입니다.")
}



primeNumber(num: 97)








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
