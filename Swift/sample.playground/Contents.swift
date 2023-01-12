import UIKit


// 범위연산자⭐️
// ========================================
var number = Int.random(in: 1...5)
print(number)
// ========================================


// switch ⭐️
// ========================================
var age = 30

print(0...30 ~= age) // true
print(31...50 ~= age) // false

switch age {
case 0...10:
    print("10대 입니다.")
case 11...20:
    print("20대 입니다.")
case 21...30:
    print("30대 입니다.")
//    fallthrough
default:
    print("늙었습니다.")
}


var temparature = 10

switch temparature {
case ..<0:
    print("0도 미만")
case 10...20:
    print("10도 이상 20미만")
default:
    print("etc...")
}


//// 일단 다른 상수 값에 바인딩한(넣은) 후, 조건절(참/거짓 문장)을 통해 다시 한번 더 조건 확인
//// (바인딩 된 상수는 케이스블럭 내부에서만 사용가능하고, 상수 바인딩은 주로 where절하고 같이 사용됨)
var num = Int.random(in: 0...10)

switch num {
case let x where x % 2 == 0:
    print("짝수 - \(x)")
case let x where x % 2 == 1:
    print("홀수 - \(x)")
default:
    print("default")
}



// ========================================



