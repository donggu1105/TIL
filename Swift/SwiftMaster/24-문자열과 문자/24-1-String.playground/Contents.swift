import UIKit



/*:
 # Part24 - 문자열과 문자
 */
/*:
 ## 문자열과 문자(Strings and Characters)
 * 아스키코드와 유니코드
 ---
 */
/**================================================================================
 - 아스키코드(ASCII) / 유니코드(UNICODE)

  [아스키코드]
 - 참고: https://www.youtube.com/watch?v=apZFcOfAr5w

  [유니코드]
 - 참고: https://youtu.be/5aJKKgSEUnY
 - 참고: https://youtu.be/MijmeoH9LT4


 - 유니코드(Unicode)는 전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 산업 표준
 - 스위프트는 유니코드의 체계를 사용
===================================================================================**/



/*:
 ---
 * 유니코드와 문자열의 저장
 ---
 */
/**===========================================================================
 - 스위프트의 문자열(String)?
 - 쌍따옴표 안에 문자(Character)들을 연결

 - 모든 문자열은 개별 인코딩된 유니코드 문자들(encoding-independent Unicode characters)로 구성
 - 유니코드 값(코드포인트 - 스칼라값)
 
 - 결국, 스위프트는 문자열을 저장할때, 하나의 문자를 유니코드의 스칼라값(UTF-32)으로 저장
   그리고 언제든지 UTF-8, UTF-16방식으로도 쉽게 변환할 수 있는 방법도 제공해줌
   1) 문자열.unicodeScalars
   2) 문자열.utf8
   3) 문자열.utf16
==============================================================================**/


var someString: String = "Some Swift😃"


// 문자열은 결국, 각 문자를 모아놓은 데이터 바구니

for code in someString.unicodeScalars {
    print(code.value)
}

/**=====================================
 - 문자열    UTF-32값         (16진법 표현)
 - "S"     -   83   ====>    53 (16진법)
 - "o"     -  111   ====>    6F (16진법)
 - "m"     -  109   ====>    6D (16진법)
 - "e"     -  101   ====>    65 (16진법)
 - " "     -   32   ====>    20 (16진법)
 - "S"     -   83   ====>    53 (16진법)
 - "w"     -  119   ====>    77 (16진법)
 - "i"     -  105   ====>    69 (16진법)
 - "f"     -  102   ====>    66 (16진법)
 - "t"     -  116   ====>    74 (16진법)
 - "😃"    -128515  ====> 1F603 (16진법)
========================================**/



someString = "\u{53}\u{6F}\u{6D}\u{65}\u{20}\u{53}\u{77}\u{69}\u{66}\u{74}\u{1F603}"

print(someString)




/*:
 ---
 * Swift공식문서로 살펴보는 유니코드 예시
 ---
 */
/**=================================================================
 - 스위프트는 내부적으로 문자열을 UTF-32방식으로 저장하고 있지만
   나머지, UTF-8, UTF-16방식으로도 쉽게 변환할 수 있는 방법도 제공해줌
  (코드값을 사용하려면 물론, for문을 통해서 내부에서 요소를 다시 추출해서 사용해야함)
 ===================================================================**/


let dogString = "Dog‼🐶"
print(dogString.utf8)


for codeUnit in dogString.utf8 {             //  8비트의 숫자값
    print("\(codeUnit) ", terminator: "")
}
print("")

// 68  / 111  / 103 / 226 128 188 / 240 159 144 182


for codeUnit in dogString.utf16 {            // 16비트의 숫자값
    print("\(codeUnit) ", terminator: "")
}
print("")

// 68 / 111 / 103 / 8252 / 55357 56374


for scalar in dogString.unicodeScalars {      // 32비트의 숫자값
    print("\(scalar.value) ", terminator: "")
}
print("")

// 68 / 111 / 103 / 8252 / 128054


//:> 스위프트는 결국, 어떠한 유니코드 인코딩 방식으로도 변환이 쉬움


/*:
 ---
 * 유니코드로 인한 스위프트 문자열의 특징과 주의점
 ---
 */

var hangul1 = "\u{D55C}"     // "한"

print("\"한\"의 글자수: ", hangul1.count)


var hangul2 = "\u{1112}\u{1161}\u{11AB}"      // "ㅎ" "ㅏ" "ㄴ"
print("\"ㅎ\"+\"ㅏ\"+\"ㄴ\"의 글자수: ", hangul2.count)


hangul1 == hangul2


// 한글과 같은 언어들을 "ㅎ" "ㅏ" "ㄴ" 내부적으로 하나의 글자로 취급 ⭐️



var word = "cafe"
print("글자의 숫자 \(word) is \(word.count)")
// "글자의 숫자 cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("글자의 숫자 \(word) is \(word.count)")
// "글자의 숫자 café is 4"




//:> 스위프트의 문자열에서는 배열같은 단순 인덱스(index) 접근이 불가능 ⭐️
// 스위프트는 문자열을 글자의 의미단위로 사용하기 때문에, 정수 인덱스 사용이 불가능

//  0, 1, 2, 3, 4 ....   (X)




/*:
 ---
 * 스위프트의 문자열 String / NSString
 ---
 */
/**===============================================================
 - 스위프트에서는 2개의 문자열 자료형을 사용

 - 문자열 내부적으로 서로 연동(bridged)
 - 1) String ▶︎ Swift String  구조체/값형식 (스위프트 문자열)
 - 2) NSString ▶︎ Foundation String  클래스/참조형식  (파운데이션 문자열)
==================================================================**/


var nsString: NSString = "Swift"   // 문제없이 저장


//let string: String = nsString   //에러발생
let string: String = nsString as String


// String <===> NSString간에 자동으로 변환컨버팅되지는 않음(타입캐스팅해야함)


nsString.length       // NSString의 length속성 ===> 유니코드수(UTF-16) 기반
string.count          // String의    count속성 ===> 의미 글자수 기반



nsString = string as NSString    // 두형식은 브릿징이 가능한 타입 (Toll-Free Bidged) ===> 타입캐스팅으로 호환되는 자료형



// 두 자료형은 서로 호환되는 자료형이지만, 유니코드를 처리하는 방식이 달라서, 조심해서 사용해야함 ⭐️


// word = café 라는 단어가 저장되어 있음

let nsWord = word as NSString

word.count
nsWord.length


// NSString은 Objected-C에서 사용하는 문자열이고
// NSString에서 더 파생된 개념인 NSAttributedString을 실제 앱을 만들때, 간혹가다 사용하는 경우가 있음
// 문자열에 클릭기능을 넣는다던지. 글자별로 색깔을 다르게 한다던지








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
