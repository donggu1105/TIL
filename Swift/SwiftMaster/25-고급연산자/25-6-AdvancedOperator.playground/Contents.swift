import UIKit

/*:
 ## 연산의 우선순위 그룹
 * 우선순위 그룹 - 우선순위와 결합성(Precedence and Associativity)
 ---
 */
// 우선 순위 그룹의 선언

precedencegroup MyPrecedence {            // higherThan 또는 lowerThan 둘중에 하나는 반드시 지정해야함
    higherThan: AdditionPrecedence        // ~보다 높은(higherThan): 지정하려는 그룹보다 순위가 낮은 그룹
    lowerThan: MultiplicationPrecedence   // ~보다 낮은(lowerThan): 지정하려는 그룹보다 순위가 높은 그룹
    associativity: left          // 결합성 ===> left / right / none
}




// 우선순위와 결합성의 선언
// https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations









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
