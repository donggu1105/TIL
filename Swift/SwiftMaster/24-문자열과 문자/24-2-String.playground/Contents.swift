import UIKit

/*:
 ## 문자열의 기본 다루기
 * 멀티라인 스트링 리터럴(Multiline String Literals)
 ---
 */
//:> 문자열을 한줄에 입력 ➞ 명시적인 줄바꿈이 불가능
let singleLineString = "These are \nthe same."       // 줄바꿈을 원하면, \n 입력   \ (Escape character)
print(singleLineString)




/**===========================================================
 - 문자열을 여러줄 입력하고 싶을때
 - 1) """ (쌍따옴표 3개를 연속으로 붙여서 입력) - 첫째줄/마지막줄에 입력
 - 2) 해당줄에는 문자열 입력 불가
 - 3) 문자열 내부에서 쓰여진대로 줄바꿈됨. ===> (줄바꿈 하지 않으려면 \(백슬레시) 입력)
 - 4) 특수문자는 문자 그대로 입력됨
 - 5) 마지막(""")는 들여쓰기의 기준의 역할
=============================================================**/


let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)



/*:
 ---
 * 문자열 내에서 특수문자 (Escape sequences)
 ---
 */
/**==============================
 [Escape character sequences]
 - \0  (null문자)
 - \\  (백슬레시)
 - \t  (탭)
 - \n  (줄바꿈 - 개행문자)
 - \r  (캐리지 리턴 - 앞줄이동)
 - \"  (쌍따옴표)
 - \'  (작은따옴표)
 - \u{유니코드값}   (1~8자리의 16진수)
=================================**/

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)




/*:
 ---
 * 로스트링(Raw String) - 확장 구분자(Extended String Delimiters)  #
 ---
 */
// 문자열내에서 특수문자를 많이 써야하는 상황이라면,
// 글자 날것 그대로 표현하는 것이 코드에서 덜 헷갈릴 수 있음

//:> 샵 기호(#)으로 문자열 앞뒤를 감싸면 내부의 문자열을 글자 그대로 인식
// 샵의 갯수를 개발자 임의로 조절 가능


var name = #"Steve"#
print(name)

let string1 = #"Line 1\nLine 2"#       // 특수문자가 그대로 인식됨
print(string1)

let string2 = #"Line 1\#nLine 2"#
print(string2)

let string3 = ###"Line 1\###nLine 2"###
print(string3)


let string4 = #"My name is \#(name)"#         // 이스케이프 시퀀스 효과를 사용하려면, 샵을 입력



let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)








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
