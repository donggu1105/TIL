import UIKit


/*:
 ## 범위(Scope)
 * Scope - 함수, if, for문 등에 모두 해당
 ---
 */
/**====================================================================================
 - 1. 변수는 코드에서 선언이 되어야, 그 이하의 코드에서 접근 가능(선언하기 이전에는 접근 불가함) (전역변수는 예외)
 - 2. 상위스코프(범위)에 선언된 변수와 상수에 접근가능하며, 하위스코프(범위)에는 접근할 수 없다.
 - 3. (동일한 스코프에서 이름이 중복될 수 없지만, 다른 스코프에서는 이름 중복이 가능)
       가장 인접한 스코프에 있는 변수와 상수에 먼저 접근 한다.
 =====================================================================================**/


/*:
 ---
 * 첫번째 예제
 ---
 */
func greeting1() {
    print("Hello")
    
    var myName = "홍길동"
    print(myName)
    
    print(name)
    
    if true {
        print(myName)
        print(name)
    }
}


//print(myName)
//print(name)



greeting1()


var name = "잡스" // 전역변수 (메모리의 데이터 영역에 저장)


greeting1()




/*:
 ---
 * 두번째 예제
 ---
 */

//func doSomething() {
//    print(realName)       // 코드는 순서대로 작동하기 때문에, 선언이 되어있어야 사용 가능
//
//    var realName = "앨런"
//}


//doSomething()




/*:
 ---
 * 세번째 예제
 ---
 */

func sayGreeting1() {
    print("Hello")
    
    
    func sayGreeting2() {
        print("Hey")
        
        if true {
            print("")
        }
    }
    
    sayGreeting2()
    
}


//sayGreeting1()
//sayGreeting2()




//:> 라인 맞추기 ➞ (전체선택: Command + A) ➞ (줄맞추기: Control + I)








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
