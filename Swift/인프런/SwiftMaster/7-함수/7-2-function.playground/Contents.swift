import UIKit


/*:
## 함수의 파라미터, 아규먼트
* 파라미터(Parameter)
---
*/
/**=============================================================
 - 파라미터: 함수 정의시, 함수 정의에 입력값으로 사용되는 변수(내부사용)
 - 아규먼트: 함수를 호출시, 함수가 필요한 파라미터의 타입과 일치하는 실제 값(외부사용).
================================================================**/


// 파라미터 이름만 사용할때(아규먼트 레이블 사용 안하면)

func printName(name: String) {                  // name: String  (파라미터)
    print("나의 이름은 \(name) 입니다.")
}



printName(name: "에디슨")          //   "에디슨" (아규먼트)




/*:
 ---
 * 1) 아규먼트 레이블(Argument Label)
 ---
 */
// 아큐먼트 레이블을 사용하면

func printName1(first name: String) {
    print("나의 이름은 \(name) 입니다.")
}



printName1(first: "뉴턴")





//아규먼트 레이블 사용 안하면


func someFunction(first: Int, second: Int) {
    print(first + second)
}


someFunction(first: 1, second: 2)




//아규먼트 레이블 사용하는 것의 이점 (일반적으로 함수를 사용할때 더 명확하게 무엇을 요구하는 지 알려줄 수 있다.)

func someFunction1(writeYourFirstNumber a:Int, writeYourSecondNumber b: Int) {
    print(a + b)
}



someFunction1(writeYourFirstNumber: 3, writeYourSecondNumber: 4)




/*:
 ---
 * 2) 아규먼트 레이블을 생략해서 사용하는 것도 가능 (와일드카드 패턴)
 ---
 */

func addPrintFunction(_ firstNum: Int, _ secondNum: Int) {
    print(firstNum + secondNum)
}



addPrintFunction(1, 2)





/*:
 ---
 * 3) 가변파라미터 - 함수의 파라미터에 정해지지 않은, 여러개의 값을 넣는 것도 가능(Variadic Parameters)
 ---
 */
/**=============================================================
 - 1) 하나의 파라미터로 2개이상의 아규먼트를 전달할 수 있다.
 - 2) 아규먼트는 배열형태로 전달된다.
 - 3) 가변 파라미터는 개별함수마다 하나씩만 선언할 수있다.(선언 순서는 상관없음)
 - 4) 가변 파라미터는 기본값을 가질 수 없다.
===============================================================**/

func test(_ numbers: Double...) -> Double {
    var total = 0.0
    
    for n in numbers {
        
        total += n
    }
    
    return total / Double(numbers.count)
    
}

test(1,2,3,4,5,6,7)

func arithmeticAverage(_ numbers: Double...) -> Double {
    
    var total = 0.0
    
    for n in numbers {
        total += n
    }
    
    return total / Double(numbers.count)
}



//arithmeticAverage(5, 6, 7, 8, 9)



arithmeticAverage(1.5, 2.5, 3.5, 4.5)





/*:
 ---
 * 4) 함수의 파라미터에 기본값(디폴트) 정하는 것도 가능
 ---
 */

func numFunction(num1: Int, num2: Int = 5) -> Int {
    var result = num1 + num2
    return result
}




numFunction(num1: 3)
numFunction(num1: 3, num2: 7)



//:> 아규먼트값이 항상 필요한 것이 아닐 수도 있다!
// 실제 애플이 미리 만들어 놓은 함수에는 기본값이 들어 있는 경우가 꽤 있다.



//print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)








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
