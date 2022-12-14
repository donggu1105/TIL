import UIKit

/*:
 ## 문자열 다루기
 * 문자열의 대소문자 변형
 ---
 */
//:> 스위프트는 대문자와 소문자를 다른 문자로 인식(유니코드 다름)

var string = "swift"


string.lowercased()    // 전체 소문자로 바꾼 문자열 리턴 (원본 그대로)
string.uppercased()    // 전체 대문자로 바꾼 문자열 리턴 (원본 그대로)

string.capitalized     // 대문자로 시작하는 글자로 리턴하는 속성 (원본 그대로)
//"swift".capitalized




// 소문자로 변형시키서 비교하는 것은 가능

"swift" == "Swift"   // false

"swift".lowercased() == "Swift".lowercased()    // true

/*:
 ---
 * 문자열 다루기 기본 - count, isEmpty 속성
 ---
 */

var emptyString = " "    // [공백]이 포함된 문자열

// 문자열은 길이를 기준으로 빈문장열을 판단

emptyString.count     // 1
emptyString.isEmpty   // false



emptyString = ""     // [빈] 문자열    (nil이 절대 아님)

emptyString.count        // 0
emptyString.isEmpty      // true



if emptyString == nil {    // 빈 문자열은 nil이 아님 ===> String타입 (O)   String?타입 (X)
    print("nil")
}



/*:
 ---
 * String의 인덱스(색인/순번) 타입
 ---
 */
//:> 문자열도 Collection 프로토콜(Array / Dictionary / Set)을 따르고 있음 ➞ 데이터바구니
/**============================================================
 - 문자열의 인덱스는 정수가 아님 ⭐️
 - (스위프트는 문자열을 글자의 의미단위로 사용하기 때문에, 정수 인덱스 사용 불가)
 
 [String.Index 타입]
 - 문자열.startIndex
 - 문자열.endIndex
 - 문자열.index(<#T##i: String.Index##String.Index#>, offsetBy: <#T##String.IndexDistance#>)
 
 - 문자열.index(after: <#T##String.Index#>)
 - 문자열.index(before: <#T##String.Index#>)
 - (다만, 인덱스의 크기 비교는 당연히 가능)
 
 - 문자열.indices     (인덱스의 모음)
 - (인덱스를 벗어나는 것에 주의)
 
 
 - 문자열.firstIndex(of: <#T##Character#>)
 - 문자열.lastIndex(of: <#T##Character#>)
 
 
 [String.Index 범위]
 - 문자열.range(of: <#T##StringProtocol#>)
 - 문자열.range(of: <#T##StringProtocol#>, options: <#T##String.CompareOptions#>, range: <#T##Range<String.Index>?#>, locale: <#T##Locale?#>)
 
 
 - String.Index를 이용, 서브스크립트 활용가능 ⭐️
 
 
 [String.Index의 정수형태로 거리는 측정 가능]
 - 문자열.distance(from: <#T##String.Index#>, to: <#T##String.Index#>)
 ==============================================================**/



let greeting = "Guten Tag!"


greeting.startIndex
print(greeting.startIndex)

greeting[greeting.startIndex]    // "G"



// 정수형태를 한번 변형해서(걸러서) 사용하는 방식 ⭐️

var someIndex = greeting.index(greeting.startIndex, offsetBy: 2)
greeting[someIndex]      // "t"


someIndex = greeting.index(greeting.startIndex, offsetBy: 1)
greeting[someIndex]      // "u"


someIndex = greeting.index(after: greeting.startIndex)
greeting[someIndex]      // "u"


someIndex = greeting.index(before: greeting.endIndex)
greeting[someIndex]      // "!"




for index in greeting.indices {       // 개별 문자의 인덱스에 접근
    print("\(greeting[index]) ", terminator: "")
}
print("")


//======================================== 출력결과는 동일하지만 접근법이 다름
for char in greeting {
    print("\(char) ", terminator: "")
}
//========================================




// 공백 문자열 다음의 글자를 알고 싶을때

var firstIndex = greeting.firstIndex(of: " ")!
var nextOfEmptyIndex = greeting.index(firstIndex, offsetBy: 1)
greeting[nextOfEmptyIndex]


// 세번째 글자를 알고 싶을때

var thirdCharIndex  = greeting.index(greeting.startIndex, offsetBy: 2)           // 스타트 인덱스에서 2만큼 이동한 인덱스로

var thirdCh = greeting[thirdCharIndex]




// 범위를 벗어나면 에러발생 주의 ⭐️

//greeting[greeting.endIndex]
greeting[greeting.index(greeting.endIndex, offsetBy: -1)]
//greeting[greeting.index(before: greeting.endIndex)]


// 예를 들자면, 아래와 같이 올바른 범위에서 실행

someIndex = greeting.index(greeting.startIndex, offsetBy: 7)


if greeting.startIndex <= someIndex && someIndex < greeting.endIndex { // 범위를 벗어나지 않는 경우 코드 실행
    print(greeting[someIndex])
}




// indices를 직접 출력해보기

for i in greeting.indices {
    print(i)
}


//let greeting = "Guten Tag!"


// 문자열 특정범위를 추출

let lower = greeting.index(greeting.startIndex, offsetBy: 2)
let upper = greeting.index(greeting.startIndex, offsetBy: 5)
greeting[lower...upper]



// 실제로는 뒤에서 배울, 교체/삭제에서 주로 범위를 활용

var range = greeting.range(of: "Tag!")!
greeting[range]


range = greeting.range(of: "tag", options: [.caseInsensitive])!
greeting[range]



// 정수 형태 수치로 거리 측정

var distance = greeting.distance(from: lower, to: upper)
print(distance)








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
