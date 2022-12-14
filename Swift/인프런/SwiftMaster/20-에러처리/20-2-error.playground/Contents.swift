import UIKit

/*:
 ## 에러 처리 방법
 * 에러 함수 정의
 ---
 */
// 1) 에러 정의 (어떤 에러가 발생할지 경우를 미리 정의)

enum HeightError: Error {  //에러 프로토콜 채택
    case maxHeight
    case minHeight
}



// 2) 에러가 발생할 수 있는 함수에 대한 정의

func checkingHeight(height: Int) throws -> Bool {
    
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



/*:
 ---
 * 에러를 처리하는 방법 - try / try? / try!
 ---
 */

/**===========================================
 1) 에러 정식 처리 방법
============================================**/

do {
    let isChecked = try checkingHeight(height: 200)
    
    if isChecked {
        print("청룡열차 가능")
    } else {
        print("후룸라이드 가능")
    }
} catch {
    print("놀이기구 타는 것 불가능")
}



/**===========================================
 2) try? (옵셔널 트라이) ===> 옵셔널 타입으로 리턴

   (1) 정상적인 경우 ==> (정상)리턴타입으로 리턴
   (2) 에러가 발생하면 ==> nil 리턴
============================================**/


let isChecked = try? checkingHeight(height: 200)      // Bool?

// 당연히, 옵셔널 타입을 벗겨서 사용해야함




/**===========================================
 3) try! (Forced 트라이) ===> 에러가 날 수 없는 경우에만 사용 가능

   (1) 정상적인 경우 ==> (정상)리턴타입으로 리턴
   (2) 에러가 발생하면 ==> 런타임에러
============================================**/


let isChecked2: Bool = try! checkingHeight(height: 150)      // Bool


// 에러가 발생할 수 없다고 확신이 있는 경우만 사용해야 함



/*:
 ---
 * Catch블럭 처리법
 ---
 */
// catch블럭은 do블럭에서 발생한 에러만을 처리하는 블럭
// 모든 에러를 반드시 처리해야만 함 (글로벌 스코프에서는 모든 에러를 처리하지 않아도 컴파일 에러발생하지 않음)



// 패턴이 있는 경우(모든 에러를 각각 따로 처리 해야함)

do {
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch HeightError.maxHeight  {    // where절을 추가해서, 매칭시킬 에러패턴에 조건을 추가할 수 있음
    
    print("키가 커서 놀이기구 타는 것 불가능")
    
} catch HeightError.minHeight {      // 생략가능
    
    print("키가 작아서 놀이기구 타는 것 불가능")
    
}



// catch 패턴이 없이 처리도 가능

do {
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch {    // error 상수를 제공 (모든 에러가 넘어옴)
    print(error.localizedDescription)
    
    if let error = error as? HeightError {    // 실제 우리가 정의한 구체적인 에러 타입이 아니고, 에러 타입(프로토콜)이 넘어올 뿐
        switch error {
        case .maxHeight:
            print("키가 커서 놀이기구 타는 것 불가능")
        case .minHeight:
            print("키가 작아서 놀이기구 타는 것 불가능")
        }
    }
}



/*:
 ---
 * Catch블럭의 처리 (Swift 5.3)
 ---
 */
// 스위프트 5.3 버전 업데이트

do {
    
    let isChecked = try checkingHeight(height: 100)
    print("놀이기구 타는 것 가능: \(isChecked)")
    
} catch HeightError.maxHeight, HeightError.minHeight {   // 케이스 나열도 가능해짐
    
    print("놀이기구 타는 것 불가능")
    
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
