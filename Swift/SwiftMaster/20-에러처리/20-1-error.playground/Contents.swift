import UIKit

/*:
 # Part20 - 에러 처리(Error Handling)
 */
/*:
 ## 에러 처리 문법
 * 에러(오류)의 이해
 ---
 */
/**=========================================================================
 - 에러의 종류는
   1) 컴파일 타임 에러 ===> 스위프트 문법과 관련된 에러(컴파일러가 미리 알고 수정해야한다고 알려줌)
   2) 런타임 에러 ===> 프로그램이 실행되는 동안 발생

 - 런타임 에러 ===> 크래시(앱이 강제로 종료)
   ===> 발생가능한 에러를 미리 처리해 두면, 강제종료되지 않음 (개발자가 처리해야만 하는 에러)
 ===========================================================================**/
/*:
 ---
 * (런타임)에러 처리가 왜 필요할까?
 ---
 */
/**====================================================================================
 - 앱이 실행하는 중간에 왜 꺼질까?
 
 - 어떤 얘기치 못한 상황이 발생할 수 있음
 - (네트워크 통신을 하는 등의 경우에서) 서버에서 데이터를 못 받아와서 ==> 꺼짐

 - 앱이 그냥 꺼지는 게 좋은가? 아니면 예를들어 "서버에서 문제가 발생했습니다. 잠시뒤에 다시 접속해 주세요"라고
   알려주는 것이 좋은 가?
 
 - 프로세스 중에서, 예외적인 상황(에러)이 발생하는 것이 미리 가능성 등을 처리해 놓으면
   앱이 무작정 꺼지는 것을 예방할 수 있음 ⭐️


 - 에러는 일반적으로 동작. 즉, 함수의 처리과정에서 일어남
 - 함수를 정의할때, 예외적인 일이 발생하는 경우가 발생할 수 있는 함수이다.라고 정의하고 처리하는 과정을 배울 것임


 - (에러 발생 가능)함수 ====>  함수 실행시에 조금 다르게 처리해야함(에러 처리) ⭐️
 =====================================================================================**/


/*:
 ---
 * 에러 처리의 과정 (3단계)
 ---
 */
// 1) 에러 정의 (어떤 에러가 발생할지 경우를 미리 정의)

enum HeightError: Error {    //에러 프로토콜 채택 (약속)
    case maxHeight
    case minHeight
}




// 2) 에러가 발생할 수 있는 함수에 대한 정의

func checkingHeight(height: Int) throws -> Bool {    // (에러를 던잘수 있는 함수 타입이다)
    
    if height > 190 {
        throw HeightError.maxHeight
    } else if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}




// 3) 에러가 발생할 수 있는 함수의 처리(함수의 실행) ===> 기존과 조금 다르다 (try와 do-catch문으로 처리)


do {
    
    let isChecked = try checkingHeight(height: 200)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch {
    
    print("놀이기구 타는 것 불가능")
    
}

/**================================================
 - do블럭  - 함수를 통한 정상적인 처리의 경우 실행하는 블럭
 - catch블럭 - 함수가 에러를 던졌을 경우의 처리 실행하는 블럭
 ==================================================**/

/*:
 ---
 * 에러 발생가능한 함수의 형태
 ---
 */
/**=========================
 - () throws -> ()
 - (Int) throws -> ()
============================**/


//[1, 2, 3, 4, 5].map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)







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
