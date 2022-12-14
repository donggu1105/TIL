import UIKit


/*:
 ## 함수와 옵셔널 타입의 사용
 * 옵셔널타입의 파라미터 사용
 ---
 */
// 옵셔널 파라미터 사용 함수의 정의

func doSomePrint(with label: String, name: String? = nil) {   // String? = nil
    print("\(label): \(name)")
}



// 함수의 실행

//doSomePrint(with: <#T##String#>, name: <#T##String?#>)


doSomePrint(with: "레이블", name: "스티브 잡스")

doSomePrint(with: "레이블", name: nil)

doSomePrint(with: "레이블")


//:> 일반적으로는 String? = nil (기본값까지 설정해서, 함수를 유연하게 사용하도록 함)
// 유연함 ==> 굳이 아규먼트를 안 넣어서 사용해도 됨
// 애플이 미리 만들어 놓은 함수/메서드에는 파라미터가 옵셔널타입과 기본값이 nil로 설정된 함수들이 많음 유의!







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
