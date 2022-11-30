import UIKit

/*:
 ## @unknown 키워드
 * 만약, 열거형의 케이스가 늘어난다면 항상 올바른 처리를 하고 있다고 말할 수 있을까?
 ---
 */
// 만약에 로그인의 경우의 수가 늘어난다면 (Non-frozen 열거형 / 얼지않은)
// (프로젝트에서 실제 늘어날 수 있는 경우가 많음)

enum LoginProvider: String {      // 3가지 케이스 ===> 4가지 케이스
    case email
    case facebook
    case google
    case kakaotalk
}


let userLogin = LoginProvider.email



// 스위치문은 (특히, 열거형)표현식에 대한 분기처리에 최적화
// (다만, 열거형의 케이스가 늘어나는 경우에 대한 안정성 보장은 별개)

switch userLogin {                // 처리하는 방식을 조금 변형
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
//case .google:
//    print("구글 로그인")
default:                         // default블럭만 추가해두는 것이 안전할까? ⭐️
    print("구글 로그인")
}

// 여기서는 간단히 눈에 보일 수 있지만, 실제 프로젝트에서는 찾기 힘듦

//:> 처리하는 로직이 항상 옳다는 보장을 하지 못함
// 에러는 나지 않을 수 있지만, 로직이 옳다고 할 수 없음

/*:
 ---
 * @unknown 어트리뷰트를 활용하는 방법 - Swift 5.0 ~
 ---
 */
/**===================================================
 - @unknown 키워드를 default블럭에 추가해둠
 
 - switch문에서 열거형의 모든 케이스를 다루지 않는 경우,
   스위치문에서 모든 열거형의 케이스를 다루지 않았다고
   경고를 통해 알려줌 ===> 개발자의 실수 가능성을 컴파일 시점에 알려줌
 
 - "Switch must be exhaustive"로 알려줌
 =====================================================**/
// unknown: 알려지지 않은


switch userLogin {
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
case .google:
    print("구글 로그인")
@unknown default:
    print("그 외의 모든 경우")
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
