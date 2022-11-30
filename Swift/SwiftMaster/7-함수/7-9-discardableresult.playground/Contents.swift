import UIKit

/*:
 ## 함수의 리턴값 유무
 - 함수의 정의
 ---
 */
// 리턴값(타입)이 없는 함수

func sayHello() {
    print("안녕하세요.")
}


//sayHello()



// 리턴값(타입)이 있는 함수

//@discardableResult
func sayHelloString() -> String {
    print("하이")
    return "안녕하세요"
}


sayHelloString()     // 실제 프로젝트에서 경고창 표시


/*:
 ---
 * 리턴 타입이 없는 함수(Void 타입) vs 리턴타입이 있는 함수의 차이 ⭐️
 ---
 */
//:> 리턴 타입이 없는 함수 ➞ 결과는 Void 타입
// 이렇게 사용하는 경우는 없음(결과값 없음)

//var hello: Void = sayhello1()

sayHello()         // 제어권




//:> 리턴 타입이 있는 함수 ➞ 결국 결과로 "값"이 있는 것 ➞ (일반적으로)사용
// 함수 자체를 값으로 볼 수 있음

var hello = sayHelloString()       // 제어권 + 결과값





/*:
 ---
 - 리턴값이 있는 함수에서 리턴값을 사용하지 않는다면
 ---
 */
// 기존의 방식

_ = sayHelloString()    // (결과값을 사용하지 않을때) 지금까지 많이 사용해오던 패턴



// 스위프트 5.2 부터

//@discardableResult   //어트리뷰트를 사용하도록함










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
