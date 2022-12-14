import UIKit

/*:
 # Part18-1 - 고차함수
 */
/*:
 ## 1) 기본 고차함수 3가지
 * 고차함수(Higher-order Function)란?
 ---
 */
/**==========================================================
 - 고차원의 함수
 - 함수를 파라미터로 사용하거나, 함수실행의 결과를 함수로 리턴하는 함수


 - 일반적으로 함수형 언어를 지향하는 언어들에 기본적으로 구현되어 있음
 - 아래의 3가지 함수를 다룸

 - 1) map 함수
 - 2) filter 함수
 - 3) reduce 함수

 - (추가적으로: forEach, compactMap, flatMap)


 - Sequence, Collection 프로토콜을 따르는 컬렉션(배열, 딕셔너리, 세트 등)
   에 기본적으로 구현되어 있는 함수
 - (Optional타입에도 구현되어 있음)
 ============================================================**/

/*:
 ---
 * 1 - map함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 새롭게 매핑해서(매핑방식은 클로저가 제공)
   새로운 배열을 리턴하는 함수
 - (각 아이템을 매핑해서, 변형해서 새로운 배열을 만들때 사용)
 ======================================================**/


let numbers = [1, 2, 3, 4, 5]

//numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)



var newNumbers = numbers.map { (num) in
    return "숫자: \(num)"
}


newNumbers = numbers.map { "숫자: \($0)" }


//print(numbers)
//print(newNumbers)   // ["숫자: 1", "숫자: 2", "숫자: 3", "숫자: 4", "숫자: 5"]





var alphabet = ["A", "B", "C", "D"]


//names.map(<#T##transform: (String) throws -> T##(String) throws -> T#>)



var newAlphabet = alphabet.map { (name) -> String in
    return name + "'s good"
}


//print(alphabet)
//print(newAlphabet)




/*:
 ---
 * 2 - filter함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 조건(조건은 클로저가 제공)을
   확인후, 참(true)을 만족하는 아이템을 걸러내서 새로운 배열을 리턴
 - (각 아이템을 필터링해서, 걸러내서 새로운 배열을 만들때 사용)
 ======================================================**/


let names = ["Apple", "Black", "Circle", "Dream", "Blue"]

//names.filter(<#T##isIncluded: (String) throws -> Bool##(String) throws -> Bool#>)



var newNames = names.filter { (name) -> Bool in
    return name.contains("B")
}


print(newNames)






let array = [1, 2, 3, 4, 5, 6, 7, 8]


//array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)


var evenNumersArray = array.filter { num in
    return num % 2 == 0
}

evenNumersArray = array.filter { $0 % 2 == 0 }

print(evenNumersArray)


// 함수로 전달해보기

//func isEven(_ i: Int) -> Bool {
//    return i % 2 == 0
//}


//let evens = array.filter(isEven)



evenNumersArray = array.filter { $0 % 2 == 0 }.filter { $0 < 5 }

print(evenNumersArray)




/*:
 ---
 * 3 - reduce함수
 ---
 */
/**====================================================
 - 기존 배열 등의 각 아이템을 클로저가 제공하는 방식으로 결합해서
   마지막 결과값을 리턴(초기값 제공할 필요)
 - (각 아이템을 결합해서 단 하나의 값으로 리턴)
 ======================================================**/


var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//numbersArray.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)



var resultSum = numbersArray.reduce(0) { (sum, num) in
    return sum + num
}

print(resultSum)



resultSum = numbersArray.reduce(100) { $0 - $1 }

print(resultSum)





/*:
 ---
 * map / filter / reduce의 활용 ⭐️
 ---
 */
numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 위의 배열 중에, 홀수만 제곱해서, 그 숫자를 다 더한 값은?


var newResult = numbersArray
                        .filter { $0 % 2 != 0 }
                        .map { $0 * $0 }
                        .reduce(0) { $0 + $1 }

print(newResult)


// 1, 9, 25, 49, 81 ===> 165








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
