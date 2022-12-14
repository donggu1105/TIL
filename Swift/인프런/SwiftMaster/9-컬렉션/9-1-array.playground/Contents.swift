import UIKit


/*:
 # Part9 - 컬렉션(Collection)
 */
/*:
 ## 1) 배열(Array)
 * 데이터를 순서대로 저장하는 컬렉션 (자동으로 순번 지정됨)
 ---
 */
/**==============================================================
 - 배열의 문법 약속
 - [] 대괄호로 묶는다. 배열의 인덱스의 시작은 0부터 (모든 프로그래밍 언어 공통 사항)
 - 1개의 배열에는 동일한 타입의 데이터만 담을 수 있다.
 - (순서가 있기 때문에) 값은 중복 가능
================================================================**/


var numsArray = [1, 2, 3, 4, 5]   // 배열 리터럴로 배열을 생성해서 저장

let numsArray1 = [20, 2, 7, 4, 5, 7]

var stringArray = ["Apple", "Swift", "iOS", "Hello"]




/*:
 ---
 * 배열의 타입 표기
 ---
 */
// 정식문법
let strArray1: Array<Int> = []


// 단축문법
let strArray2: [String] = []



/*:
 ---
 * 빈 배열의 생성
 ---
 */
let emptyArray1: [Int] = []
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()


/*:
 ---
 * 배열의 기본 기능
 ---
 */
numsArray.count
numsArray.isEmpty


numsArray.contains(1)  //파라미터로 값을 전달
numsArray.contains(8)


numsArray.randomElement()


numsArray.swapAt(0, 1)



/*:
 ---
 * 배열의 각 요소(element)에 대한 접근
 ---
 */
numsArray = [1, 2, 3, 4, 5]   // 배열 리터럴
stringArray = ["Apple", "Swift", "iOS", "Hello"]


// [] 서브스크립트 문법(대괄호를 이용한 특별한 함수)

stringArray[0]
stringArray[1]
stringArray[2]
stringArray[3]




stringArray[1] = "Steve"
print(stringArray)



stringArray.first   // 리턴값 String?  ====> 빈 배열이라면 nil 리턴
stringArray.last


// 배열의 시작 인덱스
stringArray.startIndex

stringArray.endIndex
//stringArray.endIndex.advanced(by: -1)


stringArray[stringArray.startIndex]

stringArray[stringArray.endIndex - 1]
//stringArray[stringArray.index(before: stringArray.endIndex)]



//stringArray.index(<#T##i: Int##Int#>, offsetBy: <#T##Int#>)



stringArray.firstIndex(of: "iOS")     // 앞에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째

stringArray.lastIndex(of: "iOS")     // 뒤에서 부터 찾았을때 "iOS"는 배열의 (앞에서부터) 몇번째



if let index = stringArray.firstIndex(of: "iOS") {
    print(index)
}




/*:
 ---
 * 삽입하기 (insert)
 ---
 */
var alphabet = ["A", "B", "C", "D", "E", "F", "G"]


// 앞 또는 중간에 삽입하기

alphabet.insert("c", at: 4)

//alphabet.insert("c", at: alphabet.endIndex)


alphabet.insert(contentsOf: ["a","b","c"], at: 0)

//alphabet.insert(contentsOf: ["a","b","c"], at: alphabet.endIndex)




/*:
 ---
 * 교체하기 (replace)
 ---
 */
alphabet = ["A", "B", "C", "D", "E", "F", "G"]


// 요소 교체하기
alphabet[0] = "a"


// 범위를 교체하기
alphabet[0...2] = ["x", "y", "z"]



// 원하는 범위 삭제
alphabet[0...1] = []
alphabet





// 교체하기 함수 문법

alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])




/*:
 ---
 * 추가하기 (append)
 ---
 */
alphabet = ["A", "B", "C", "D", "E", "F", "G"]


alphabet += ["H"]



// 추가하기 함수 문법

alphabet.append("H")   // 맨 마지막에 추가하는 것

alphabet.append(contentsOf: ["H", "I"])



//alphabet.append(7)   // 에러 ===> 동일한 자료형만 저장가능함





/*:
 ---
 * 삭제(제거)하기 (remove)
 ---
 */
alphabet = ["A", "B", "C", "D", "E", "F", "G"]



// 서브스크립트 문법으로 삭제

alphabet[0...2] = []   //빈배열 전달하면 해당 범위가 삭제


// 요소 한개 삭제
alphabet.remove(at: 2)  // 삭제하고, 삭제된 요소 리턴
//alphabet.remove(at: 8)    // 잘못된 인덱스 전달 ====> 에러발생


// 요소 범위 삭제
alphabet.removeSubrange(0...2)



alphabet = ["A", "B", "C", "D", "E", "F", "G"]


alphabet.removeFirst()   // 맨 앞에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)
alphabet.removeFirst(2)   // 앞의 두개의 요소 삭제 ===> 리턴은 안함


alphabet.removeLast()   // 맨 뒤에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)
alphabet.removeLast(2)



// 배열이 비어있는지도 잘 확인해보고 삭제(제거)해야함 =======> 에러
// alphabet.removeFirst()    // 리턴형 String
// alphabet.removeLast()     // 리턴형 String




// 배열의 요소 모두 삭제(제거)
alphabet.removeAll()
alphabet.removeAll(keepingCapacity: true)  // 저장공간을 일단은 보관해 둠. (안의 데이터만 일단 날림)





/*:
 ---
 * 배열의 기타 기능
 ---
 */

var nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]



// 배열을 정리해보기

// 1) 배열을 직접정렬하는 메서드  sort  (동사)
// 2) 정렬된 새로운 배열을 리턴  sorted (동사ing/동사ed)



nums.sort()   // 배열을 직접 정렬 (오름차순) (배열리턴 하지 않음)
nums.sorted()    //오름차순으로 정렬


nums.reverse()   // 요소를 역순으로 정렬  (배열리턴 하지 않음)
nums.reversed()


nums.sorted().reversed()
// 새로운 배열은 생성하지 않고, 배열의 메모리는 공유하면서 역순으로 열거할 수 있는 형식을 리턴



// 배열을 랜덤으로 섞기

//nums.shuffle()    // 요소의 순서 랜덤으로 직접 바꾸기
//nums.shuffled()





/*:
 ---
 * 배열의 비교
 ---
 */

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]


// 두 배열을 비교해보기

a == b   // false
a != b   // true

// 개별요소 비교, 저장순서도 비교 하기 때문에



/*:
 ---
 * 활용
 ---
 */
// 특정 요소 한개 삭제하기
// ===> 직접 삭제는 불가 (1) 인덱스 찾아서, (2) 인덱스에 해당하는 요소 지우기

var puppy1 = ["p", "u", "p", "p", "y"]



if let lastIndexOfP = puppy1.lastIndex(of: "p") {
    puppy1.remove(at: lastIndexOfP)
}




if !nums.isEmpty {            // "!"(true ====> false)  (false ====> true)
    print("\(nums.count) element(s)")
} else {
    print("empty array")
}




// 배열의 배열 접근

var data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]



data[0][2]




/*:
 ---
 * 반복문과의 결합
 ---
 */
// 각 요소에 차례대로 접근, 배열과 반복문은 필연적으로 많이 쓰임

for i in nums {
    print(i)
}




//:> enumerate: 영어로 열거하다는 뜻

// enumerated() ===> 열거된 것들을 Named 튜플 형태로 한개씩 전달

// 데이터 바구니이기 때문에,
// 실제 번호표(index)까지 붙여서, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능

nums = [10, 11, 12, 13, 14]


// (offset: 0, element: 10)


for tuple in nums.enumerated() {
    //print(tuple)
    print("\(tuple.0) - \(tuple.1)")
}



for (index, word) in nums.enumerated() {      // 바로 뽑아내기
    print("\(index) - \(word)")
}




for (index, value) in nums.enumerated().reversed() {      // 거꾸로 뒤에서 부터
    print("\(index) - \(value)")
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
