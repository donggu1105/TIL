import UIKit


/*:
## 4) 멤버의 확장(서브스크립트)
 * 4. 서브스크립트의 확장
 ---
 */
// 확장으로 서브스크립트 추가 가능함

// Int(정수형 타입)에 서브스크립트 추가해보기 (기본자리수의 n자리의 십진수 반환하도록 만들기)

// 예시
// 123456789[0]    // 9
// 123456789[1]    // 8
// 123456789[2]    // 7


extension Int {
    subscript(num: Int) -> Int {
        
        var decimalBase = 1
        
        for _ in 0..<num {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
        
    }
}



123456789[0]      // (123456789 / 1) ==> 123456789 % 10 ==> 나머지 9
123456789[1]      // (123456789 / 10) ==> 12345678 % 10 ==> 나머지 8
123456789[2]      // (123456789 / 100) ==> 1234567 % 10 ==> 나머지 7
123456789[3]      // (123456789 / 1000) ==> 123456 % 10 ==> 나머지 6




// Int값에 요청된 자릿수가 넘어간 경우 0 반환

746381295[9]     // 0


// 앞에 0 이 존재 하는 것과 같음

746381295[12]







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
