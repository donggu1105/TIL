import UIKit

/*:
 ## 특정문자의 (검색 및) 제거
 * 어떻게 문자열에 있는 특정문자들을 제거할 수 있을까?
 ---
 */
/**==========================================================
[특정 문자들을 제거할때 사용하기 위한 메서드]
 
1) 간단하게 앞뒤의 특정 문자를 제거하는 메서드
 - 문자열.trimmingCharacters(in: <#T##CharacterSet#>)

 
2) 문자열의 중간에 특정 문자를 제거하는 방법 ⭐️
   "해당 특정 문자"를 기준으로 (잘라서) 문자열을 배열로 ===> (다시 배열을) 문자열로
 
 - 문자열.components(separatedBy: <#T##CharacterSet#>).joined()
=========================================================**/
//CharacterSet.uppercaseLetters




// 1) 앞뒤의 공백문자의 제거

var userEmail = " my-email@example.com "

var trimmedString = userEmail.trimmingCharacters(in: [" "])
print(trimmedString)
// "my-email@example.com" (처음, 마지막의 공백 문자열 제거)



// CharacterSet 개념을 활용해서
trimmedString = userEmail.trimmingCharacters(in: .whitespaces)
print(trimmedString)




// 2) 앞뒤의 특정문자의 제거

var someString = "?Swift!"
var removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)


someString = "?Swi!ft!"
removedString = someString.trimmingCharacters(in: ["?","!"])
print(removedString)       // 중간에 있는 !는 제거하지 못함



//:> 중간에 있는 특수문자의 제거 원리: 해당 특수문자를 기준으로 문자열을 배열로 만든다음 → 다시 문자열로 변환


// 3) (중간에 포함된)공백문자의 제거

var name = " S t e v e "
var removedName = name.components(separatedBy: " ").joined()    //["", "S", "t", "e", "v", "e", ""]
print(removedName)



// 4) (중간에 포함된)특수문자의 제거

var phoneNum = "010-1234-1234"
var newPhoneNum = phoneNum.components(separatedBy: "-").joined()   // ["010", "1234", "1234"]
print(newPhoneNum)


// 5) 여러개의 특수문자를 한꺼번에 제거

var numString =  "1+2-3*4/5"
var removedNumString =  numString.components(separatedBy: ["+","-","*","/"]).joined()
print(removedNumString)




// 6) components(separatedBy:)와 거의 동일한 메서드 split(separator:) 그러나 차이는 있음

var str =  "Hello Swift"
var arr = str.split(separator: " ")    // 서브스트링으로 리턴함
print(arr)
print(arr.joined())


// - (1) split은 Substring 배열로 리턴
str.split(separator: " ")



// - (2) split은 클로저를 파라미터로 받기도 함 (클로저에서 원하는 함수내용을 정의하면 되므로 활용도가 더 높을 수 있음)
str.split { $0 == " " }

//str.split(whereSeparator: <#T##(Character) throws -> Bool#>)



/*:
 ---
 * (미리 정의된) 특정 문자 집합(Set)의 개념을 이용하면, 조금 더 편하게 사용가능
 ---
 */
// 구조체로 구현되어 있는
// 문자집합 (문자열 검색, 잘못된 문자 삭제 등에 주로 활용) (기본적인 Set성격)

/**=========================================
 [CharacterSet] 유니코드 기준
 - .symbols                // 기호
 - .alphanumerics          // 문자 + 숫자
 - .decimalDigits          // 10진법 숫자
 - .letters                // 문자 (유니코드상 Letter, Mark 카테고리 해당 문자)
 - .lowercaseLetters       // 소문자
 - .uppercaseLetters       // 대문자  ["A", "B", "C", "D", "E" ...]
 - .whitespaces            // 공백문자 [" "]
 - ....등등
 
 참고: https://developer.apple.com/documentation/foundation/characterset
============================================**/



// 문자셋을 활용해서

userEmail = " my-email@example.com "

var characterSet = CharacterSet.whitespaces   // 공백문자 집합

trimmedString = userEmail.trimmingCharacters(in: characterSet)
print(trimmedString)




name = " S t e v e "

removedName = name.components(separatedBy: characterSet).joined()
print(removedName)




var phoneNumbers = "010 1111 2222"
print(phoneNumbers.components(separatedBy: .whitespaces).joined())





//:> 특정 문자열 검색에도 활용가능
name = "hello+world"


if let range = name.rangeOfCharacter(from: .symbols) {
    print(name[range])
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
