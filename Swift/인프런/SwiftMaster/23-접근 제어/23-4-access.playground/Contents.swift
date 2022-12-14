import UIKit

/*:
 ## 속성과 접근 제어
 * 속성의 읽기 설정(getter)과 속성의 쓰기 설정(setter)의 접근제어 (계산 속성을 말하는 것 아님)
 ---
 */
//:> 저장, 계산속성의 읽기와 쓰기의 접근 제어 수준을 구분해서 구현가능
// 일반적으로 밖에서 쓰는 것(setter)은 불가능하도록 구현하는 경우가 많음

struct TrackedString {
    //var numberOfEdits = 0                   // 외부에서도 변경가능
    //private var numberOfEdits = 0           // 이렇게 선언하면, 읽기도 불가능해짐
    private(set) var numberOfEdits = 0        // setter에 대해서만 private 선언 ⭐️
    //internal private(set) var numberOfEdits = 0
    
    // 속성 관찰자
    var value: String = "시작" {
        didSet {
            numberOfEdits += 1
        }
    }
}


var stringToEdit = TrackedString()
stringToEdit.value = "첫설정"
stringToEdit.value += " 추가하기1"
stringToEdit.value += " 추가하기2"
stringToEdit.value += " 추가하기3"
print("수정한 횟수: \(stringToEdit.numberOfEdits)")
print(stringToEdit.value)


// 외부에서 직접설정하는 것은 불가능 (읽는 것은 가능) ⭐️
//stringToEdit.numberOfEdits = 3




// 속성의 읽기설정과 속성의 쓰기설정에 대해 각각 명시적으로 선언도 가능
/**=======================================================
 - 변수 및 속성, 서브스크립트에 쓰기(setter)수준을 읽기(getter)수준
   보다 낮은 접근 수준으로 설정 가능
 
 - internal private(set) var numberOfEdits = 0 이라고 선언하면
 
 - 1) 속성의 읽기설정(getter)은 - internal
 - 2) 속성의 쓰기설정(setter)은 - private(set)
 
 - 저장속성/계산속성 모두에 설정 가능
 =========================================================**/






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
