import UIKit

/*:
 ## @escaping 키워드
 * 함수의 파라미터 중 클로저 타입에 @escaping 키워드가 필요한 경우
 ---
 */
/**==========================================================================
 - 원칙적으로 함수의 실행이 종료되면 파라미터로 쓰이는 클로저도 제거됨
 - @escaping 키워드는 클로저를 제거하지 않고 함수에서 탈출시킴(함수가 종료되어도 클로저가 존재하도록 함)
 - ==> 클로저가 함수의 실행흐름(스택프레임)을 벗어날 수 있도록 함
 ============================================================================**/
 
 

// (1) 클로저를 단순 실행 (non-escaping) =====================
//     (지금까지 다뤘던 내용)

func performEscaping1(closure: () -> ()) {
    print("프린트 시작")
    closure()
}


performEscaping1 {
    print("프린트 중간")
    print("프린트 종료")
}




// (2) 클로저를 외부변수에 저장 (@escaping 필요) =================

/**===========================================
 @escaping 사용의 대표적인 경우
 - 1) 어떤 함수의 내부에 존재하는 클로저(함수)를 외부 변수에 저장
 - 2) GCD (비동기 코드의 사용)
 =============================================**/



var aSavedFunction: () -> () = { print("출력") }

//aSavedFunction()



func performEscaping2(closure: @escaping () -> ()) {
    aSavedFunction = closure         // 클로저를 실행하는 것이 아니라  aSavedFunction 변수에 저장
    //closure()
}


//aSavedFunction()


performEscaping2(closure: { print("다르게 출력") })


//aSavedFunction()




// 또다른 예제 (GCD 비동기 코드)


func performEscaping1(closure: @escaping (String) -> ()) {
    
    var name = "홍길동"
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {   //1초뒤에 실행하도록 만들기
        closure(name)
    }
    
}



performEscaping1 { str in
    print("이름 출력하기: \(str)")
}







/*:
 ## @autoclosure 키워드
 * 함수의 파라미터 중 클로저 타입에 @autoclosure 키워드를 붙이는 이유
 ---
 */
// 클로저 앞에 @autoclosure 키워드 사용(파라미터가 없는 클로저만 가능)

func someFuction(closure: @autoclosure () -> Bool) {
    if closure() {
        print("참입니다.")
    } else {
        print("거짓입니다.")
    }
}


var num = 1


// 실제로 함수를 사용하려고 하면


//someFuction(closure: <#T##Bool#>)

someFuction(closure: num == 1)


/**========================================================================
 - 일반적으로 클로저 형태로 써도되지만, 너무 번거로울때 사용
 - 번거로움을 해결해주지만, 실제 코드가 명확해 보이지 않을 수 있으므로 사용 지양(애플 공식 문서)
 - 잘 사용하지 않음. 읽기위한 문법
==========================================================================**/



// autoclosure는 기본적으로 non-ecaping 특성을 가지고 있음

func someAutoClosure(closure: @autoclosure @escaping () -> String) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("소개합니다: \(closure())")
    }
}


someAutoClosure(closure: "제니")










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
