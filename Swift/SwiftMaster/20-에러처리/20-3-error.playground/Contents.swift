import UIKit


/*:
 ## 에러를 던지는 함수를 처리하는 함수
 * 에러 정의
 ---
 */
// 에러정의
enum SomeError: Error {
    case aError
}


// 에러를 던지는 함수 정의 (무조건 에러를 던진다고 가정)
func throwingFunc() throws {
    throw SomeError.aError
}


// 에러의 처리
do {
    try throwingFunc()
} catch {
    print(error)
}



/*:
 ---
 * 일반적인 함수로 처리
 ---
 */
// 함수 내부에서 do-catch문으로 에러를 처리
// 즉, 발생한 에러를 catch블럭에서 받아서 알맞은 처리

func handleError() {
    do {
        try throwingFunc()
    } catch {
        print(error)
    }
}


handleError()


/*:
 ---
 * 1 - throwing함수로 에러 다시 던지기
 ---
 */
/**====================================================
 - 함수 내에서 에러를 직접처리하지 못하는 경우, 에러를 다시 던질 수 있음
 ====================================================**/

func handleError1() throws {
    //do {
    try throwingFunc()
    //}                     // catch블럭이 없어도 에러를 밖으로 던질 수 있음 ⭐️
}



do {
    try handleError1()   // 에러를 받아서 처리 가능
} catch {
    print(error)
}


/*:
 ---
 * 2 - rethrowing함수로 에러 다시 던지기(rethrows 키워드)
 ---
 */
/**================================================================
 - 에러를 던지는 throwing함수를 파라미터로 받는 경우, 내부에서 다시 에러를 던지기 가능
 - rethrows키워드 필요 (Rethrowing메서드)
 ==================================================================**/


// 다시 에러를 던지는 함수(방법1)
func someFunction1(callback: () throws -> Void) rethrows {
    try callback()             // 에러를 다시 던짐(직접 던지지 못함)
    // throw (X)
}


// 다시 에러를 던지는 함수(방법2) - 에러변환
func someFunction2(callback: () throws -> Void) rethrows {
    enum ChangedError: Error {
        case cError
    }
    
    do {
        try callback()
    } catch {   // catch구문에서는 throw (O)
        throw ChangedError.cError    // 에러를 변환해서 다시 던짐
    }
}




// 실제 에러를 다시던지는(rethrowing)함수를 처리하는 부분

do {
    try someFunction1(callback: throwingFunc)
} catch {
    print(error)
}



do {
    try someFunction2(callback: throwingFunc)
} catch {
    print(error)
}






/*:
 ## 메서드 / 생성자
 * 메서드 / 생성자에 throw키워드의 적용
 ---
 */
/**=======================================================================
 - 에러는 1)Throwing함수 뿐만아니라, 2) 메서드와 3)생성자에도 적용 가능
 - 에러는 던질 수 있는 메서드는 Throwing메서드, 에러는 던질 수 있는 생성자는 Throwing생성자
 =========================================================================**/

// 에러 정의

enum NameError: Error {
    case noName
}



// 생성자와 메서드에도 적용 가능
class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("수업을 올바르게 생성")
        }
    }
    
}



// 에러 처리 (생성자에 대한)

do {
    let _ = try Course(name: "스위프트5")
} catch NameError.noName {
    print("이름이 없어 수업이 생성 실패하였습니다.")
}



/*:
 ---
 * 생성자와 메서드의 재정의
 ---
 */

class NewCourse: Course {
    
    override init(name: String) throws {
        try super.init(name: name)
        
    }
}


/**=================================================================
 - Throwing 메서드/생성자는 재정의할 때, 반드시 Throwing메서드/생성자로 재정의해야함
   (Throwing 메서드/생성자를 일반 메서드/생성자로 재정의 불가)

 - 일반 메서드/생성자를 Throwing 메서드/생성자로 재정의 하는 것은 가능
   (일반 메서드/생성자의 범위가 더 큼)
 
 [상속관계에서]
 - (상위) throws    (하위) throws재정의    (O 가능)
 
 - (상위) 일반       (하위) throws재정의    (O 가능)
   (상위) throws    (하위) 일반재정의       (X 불가능)
 
 - (상위) throws    (하위) rethrows재정의  (O 가능)
   (상위) rethrows  (하위) throws재정의    (X 불가능)

 - Throwing메서드와 Rethrowing메서드를 비교하면 Rethrowing메서드의 범위가 더 작음
 ===================================================================**/






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
