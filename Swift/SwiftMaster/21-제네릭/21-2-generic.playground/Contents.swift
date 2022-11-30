import UIKit

/*:
 ## 제네릭 타입의 정의
 * 제네릭(Generics) 구조체 / 클래스 / (열거형)
 ---
 */
/**====================================================================
 - 클래스, 구조체, 열거형의 타입이름 뒤에 타입 파라미터<T>를 추가하면, 제네릭 타입으로 선언됨
 - 타입 파라미터는 타입(형식) 이름뒤에 선언, 타입 제약 문법도 동일함  GridPoint<T: Equatable>

 - 속성의 자료형, 메서드의 파라미터형식, 리턴형을 타입 파라미터로 대체 가능
 ======================================================================**/


// 구조체로 제네릭의 정의하기
// 클래스, 구조체를 정의하는 데, 안의 멤버 변수들은 여러가지 타입을 가질 수 있는 가능성이 있을 것 같다면?


struct Member {
    var members: [String] = []
}



struct GenericMember<T> {
    var members: [T] = []
}



var member1 = GenericMember(members: ["Jobs", "Cook", "Musk"])
var member2 = GenericMember(members: [1, 2, 3])




// 클래스로 제네릭의 정의하기

class GridPoint<A> {
    var x: A
    var y: A
    
    init(x: A, y: A){
        self.x = x
        self.y = y
    }
}


let aPoint = GridPoint(x: 10, y: 20)
let bPoint = GridPoint(x: 10.4, y: 20.5)




// 열거형에서 연관값을 가질때 제네릭으로 정의가능
// (어짜피 케이스는 자체가 선택항목 중에 하나일뿐(특별타입)이고, 그것을 타입으로 정의할 일은 없음)

enum Pet<T> {
    case dog
    case cat
    case etc(T)
}



let animal = Pet.etc("고슴도치")




/*:
 ---
 * 제네릭(Generics) 구조체의 확장
 ---
 */
// 정의

struct Coordinates<T> {
    var x: T
    var y: T
}



// 제네릭을 Extension(확장)에도 적용할 수 있다. (확장 대상을 제한하는 것도 가능은 함)

extension Coordinates {     // Coordinates<T> (X)
    
    // 튜플로 리턴하는 메서드
    func getPlace() -> (T, T) {
        return (x, y)
    }
}


let place = Coordinates(x: 5, y: 5)
print(place.getPlace())




// where절 추가도 가능
// Int타입에만 적용되는 확장과 getIntArray() 메서드

extension Coordinates where T == Int {     // Coordinates<T> (X)
    
    // 튜플로 리턴하는 메서드
    func getIntArray() -> [T] {
        return [x, y]
    }
}


let place2 = Coordinates(x: 3, y: 5)
place2.getIntArray()




//let place3 = Coordinates(x: 3.5, y: 2.5)
//place3.getIntArray()



/*:
 ---
 * 타입 제약(Type Constraint)
 ---
 */
/**==================================================================
 - 제네릭에서 타입을 제약할수 있음
 - 타입 매개 변수 이름 뒤에 콜론으로 "프로토콜" 제약 조건 또는 "단일 클래스"를 배치 가능
 - (1) 프로토콜 제약 <T: Equatable>
 - (2) 클래스 제약 <T: SomeClass>
====================================================================**/



// Equatable 프로토콜을 채택한 타입만 해당 함수에서 사용 가능 하다는 제약

func findIndex<T: Equatable>(item: T, array:[T]) -> Int? {     // <T: Equatable>
    for (index, value) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}


let aNumber = 5
let someArray = [3, 4, 5, 6, 7]

if let index = findIndex(item: aNumber, array: someArray) {
    print("밸류값과 같은 배열의 인덱스: \(index)")
}


// 클래스 제약의 예시


class Person {}
class Student: Person {}

let person = Person()
let student = Student()



// 특정 클래스와 상속관계에 내에 있는 클래스만 타입으로 사용할 수 있다는 제약  (구조체, 열거형은 사용 못함)
// (해당 타입을 상속한 클래스는 가능)

func personClassOnly<T: Person>(array: [T]) {
    // 함수의 내용 정의
}


personClassOnly(array: [person, person])
personClassOnly(array: [student, student])

//personClassOnly(array: [Person(), Student()])



/*:
 ---
 * 반대로 구체/특정화(specialization) 함수구현도 가능
 ---
 */
/**=================================================================================
 - 항상 제네릭을 적용시킨 함수를 실행하게만 하면, 또다른 불편함이 생기지 않을까?
 - (제네릭 함수가 존재하더라도) 동일한 함수이름에 구체적인 타입을 명시하면, 해당 구체적인 타입의 함수가 실행됨
 ===================================================================================**/


// 문자열의 경우, 대소문자를 무시하고 비교하고 싶어서 아래와 같이 구현 가능 ⭐️
// 위의 findIndex<T: Equatable>(item: T, array:[T]) -> Int? 와 완전 동일

func findIndex(item: String, array:[String]) -> Int? {
    for (index, value) in array.enumerated() {
        if item.caseInsensitiveCompare(value) == .orderedSame {
            return index
        }
    }
    return nil
}



let aString = "jobs"
let someStringArray = ["Jobs", "Musk"]


if let index2 = findIndex(item: aString, array: someStringArray) {
    print("문자열의 비교:", index2)
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
