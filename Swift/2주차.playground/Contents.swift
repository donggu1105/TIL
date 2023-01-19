import UIKit

var optionalVal: String? = "test"


if let val = optionalVal {
    print(val)
}






func test(parameter: String?) {
    guard let parameter = parameter else {return}
    print("여기")
    print(parameter)
}

test(parameter: optionalVal)


/**============================================================================
- 옵셔널 체이닝 (옵셔널 타입에 대해, 접근연산자 호출하는 방법)
- 1) 옵셔널체이닝의 결과는 항상 옵셔널이다.
- 2) 옵셔널체이닝에 값 중에서 하나라도 nil을 리턴한다면, 이어지는 표현식을 평가하지 않고 nil을 리턴
===============================================================================**/

// 옵셔널타입에 대해 접근연산자를 사용하는 방법

class Dog {
    var name: String?
    var weight: Int
    
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(self.name)가 앉았습니다.")
    }
    
    func layDown() {
        print("누웠습니다.")
    }
}


class Human {
    var dog: Dog?
}

var choco = Dog(name: "초코", weight: 15)
choco.name
choco.sit()



var human2: Human? = Human()
human2?.dog = choco
human2?.dog?.name
print(human2?.dog?.name)      // Optional("초코얌")



/**============================================================================
- 옵셔널 체이닝 (옵셔널 타입에 대해, 접근연산자 호출하는 방법)
- 1) 옵셔널체이닝의 결과는 항상 옵셔널이다.
- 2) 옵셔널체이닝에 값 중에서 하나라도 nil을 리턴한다면, 이어지는 표현식을 평가하지 않고 nil을 리턴
===============================================================================**/

class Person {
    var name: String?
}


class Library1 {
    var books: [String: Person]?
}


var person1 = Person()
person1.name = "Jobs"
print(person1.name)


var person2 = Person()
person2.name = "Musk"
print(person2.name)

var library = Library1()
library.books = ["Apple": person1, "Tesla": person2]



library.books?["Apple"]?.name
library.books?["Tesla"]?.name

// 1. books?  ====> 딕셔너리 자체가 없을 수 있음을 의미
// 2. books?["Apple"]?  ====> 딕셔너리의 결과값이 없을 수 있음을 의미



// enumerated() ===> 열거된 것들을 Named 튜플 형태로 한개씩 전달

// 데이터 바구니이기 때문에,
// 실제 번호표(index)까지 붙여서, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능



var nums = [10, 11, 12, 13, 14]


// (offset: 0, element: 10)


for tuple in nums.enumerated() {
    print(tuple)
    print("\(tuple.0) - \(tuple.1)")
}



for (index, word) in nums.enumerated() {      // 바로 뽑아내기
    print("\(index) - \(word)")
}




for (index, value) in nums.enumerated().reversed() {      // 거꾸로 뒤에서 부터
    print("\(index) - \(value)")
}



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
