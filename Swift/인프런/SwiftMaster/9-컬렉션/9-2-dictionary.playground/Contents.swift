import UIKit



/*:
 ## 2) 딕셔너리(Dictionary)
 * 데이터를 키와 값으로 하나의 쌍으로 만들어 관리하는 컬렉션
 ---
 */
/**==============================================================
 - 딕셔너리의 문법 약속
 - [] 대괄호로 묶는다. (쌍을 콜론으로 처리)
 - 키값은 유일해야함 / 중복 불가능(구분하는 요소이기 때문에) 밸류값은 중복 가능
 - 1개의 딕셔너리에는 동일한 자료형 쌍의 데이터만 담을 수 있음
 - 키값은 Hashble 해야함
================================================================**/



var dic = ["A": "Apple", "B": "Banana", "C": "City"]   // 딕셔너리 리터럴로 생성해서 저장

let dic1 = [1: "Apple", 2: "Banana", 3: "City"]



// 내부적으로 순서가 존재하지 않음

print(dic)
print(dic1)



/*:
 ---
 * 딕셔너리의 타입 표기
 ---
 */
// 단축문법
var words: [String: String] = [:]

// 정식문법
let words1: Dictionary<Int, String>




/*:
 ---
 * 빈 딕셔너리의 생성
 ---
 */
let emptyDic1: Dictionary<Int, String> = [:]
let emptyDic2 = Dictionary<Int, String>()
let emptyDic3 = [Int: String]()




//var dictFromLiteral = [:]    // 타입 정보가 없으면 유추할 수가 없다.


var dictFromLiteral = ["1": 1, "2": 2]

dictFromLiteral = [:]    // 이미 위에서 타입을 정의했다면, 아래에서 빈 값으로 넣는 것은 괜찮음



/*:
 ---
 * 딕셔너리의 기본 기능
 ---
 */
dic = ["A": "Apple", "B": "Banana", "C": "City"]



dic.count
dic.isEmpty


// contains 함수가 존재하긴 하나, 뒤에서 배울 클로저의 내용을 알아야함
// dic.contains(where: <#T##((key: String, value: String)) throws -> Bool#>)



dic.randomElement()      // Named Tuple 형태로 리턴




/*:
 ---
 * 딕셔너리의 각 요소(element)에 대한 접근 (키 값으로 접근)
 ---
 */
// 배열

var numsArray = [1, 2, 3, 4, 5]

numsArray[0]



//:> 딕셔너리는 기본적으로 서브스크립트[ ]를 이용한 문법을 주로 사용
// 딕셔너리
dic = ["A": "Apple", "B": "Banana", "C": "City"]



dic["A"]        // nil의 가능성 =====> String?(옵셔널)
//print(dic["A"])
//print(dic["Q"])



if let a = dic["A"] {    // 옵셔널 바인딩
    print(a)
} else {
    print("Not found")
}



// 딕셔너리는 값만 따로 검색하는 방법은 제공하지 않음. ⭐️
// 서브스크립트 문법으로 "키"를 전달


// 참고 (잘 사용하지는 않음)
dic["S", default: "Empty"]       // nil이 발생할 확률이 없음
// 자료가 없으면 기본값을 리턴하는 문법  ===> 리턴 String




dic.keys
dic.values


dic.keys.sorted()
dic.values.sorted()



for key in dic.keys.sorted() {     // 오름차순 정렬  ===> "return 배열" 배열이 됨
    print(key)
}




/*:
 ---
 * 업데이트 (update) - 삽입하기 / 교체하기 / 추가하기
 ---
 */
words = [:]



words["A"] = "Apple"   // 애플로 다시 바꾸기
words

words["B"] = "Banana"  // 동일한 키가 없으면 ===> 추가하기
words

words["B"] = "Blue"    // 동일한 키가 있으면 ===> 기존 밸류 덮어쓰기
words


words.updateValue("City", forKey: "C")



// (정식 기능) 함수 문법 (update + insert = upsert)

words.updateValue("City", forKey: "C")   // 새로운 요소가 추가되면 ==> 리턴 nil
words




//words = [:]      // 빈 딕셔너리로 만들기
words = ["A": "A"]   // 전체 교체하기(바꾸기)




//:> 딕셔너리는 append 함수를 제공하지 않음
// append는 순서가 있는 컬렉션의 끝에 추가하는 개념
// 딕셔너리는 순서가 없기 때문에, update를 통해서 추가



/*:
 ---
 * 삭제(제거)하기 (remove)
 ---
 */
dic = ["A": "Apple", "B": "Banana", "C": "City"]


// 요소 삭제해 보기

dic["B"] = nil    // 해당요소 삭제
dic


dic["E"] = nil   // 존재하지 않는 키/값을 삭제 ======> 아무일이 일어나지 않음(에러아님)
dic



// 함수로 삭제해보기

dic.removeValue(forKey: "A")   // 삭제후, 삭제된 값 리턴

dic.removeValue(forKey: "A")   // 다시 삭제해보기 ===> nil리턴




// 전체 삭제하기

dic.removeAll()
dic.removeAll(keepingCapacity: true)





/*:
 ---
 * 딕셔너리의 비교
 ---
 */

let a = ["A": "Apple", "B": "Banana", "C": "City"]
let b = ["A": "Apple", "C": "City", "B": "Banana"]


// 비교 연산자
a == b   // true
// 딕셔너리는 원래 순서가 없기 때문에, 순서는 상관없음
// (순서 상관없이 무조건 true나옴 - Hashable하기 때문에, 순서 상관없이 비교가능)


a != b   // false





/*:
 ---
 * 딕셔너리의 활용
 ---
 */
// 딕셔너리의 중첩 사용

var dict1 = [String: [String]]()        // 딕셔너리 밸류에 "배열"이 들어갈 수도 있다.


dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1

//dict1["arr"] = "A"



var dict2 = [String: [String: Int]]()     // 딕셔너리 안에 딕셔너리가 들어갈 수 있다.

dict2["dic1"] = ["name": 1, "age": 2]

dict2["dic2"] = ["name": 2, "age": 4]

dict2




/*:
 ---
 * 반복문과의 결합
 ---
 */
// 딕셔너리 열거해서 프린트 하기

let dict = ["A": "Apple", "B": "Banana", "C": "City"]


// 딕셔너리는 열거하지 않아도, Named 튜플 형태로 하나식 꺼내서 전달
// 순서가 없으므로, 실행마다 순서가 달라짐 ⭐️



// 데이터 바구니이기 때문에,
// 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능


for (key, value) in dict {
    print("\(key): \(value)")
}


for (key, _) in dict {
    print("Key :", key)
}


for (_, value) in dict {
    print("Value :", value)
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
