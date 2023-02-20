import Foundation

// ========== 1 ======== 값타입의 캡처 / 캡처리스트

var num = 8

let valueCaptureClousure = {
    print(num)
}

num = 1

valueCaptureClousure() // ? 헤일리: 1 | 리디아:1 | 셀린: 1

num = 3

valueCaptureClousure() // 헤일리: 3| 리디아: 3| 셀린: 3


let valueCaptureListClosure = { [num] in
    print(num)
}

num = 7

valueCaptureListClosure() // 헤일리: 3| 리디아: 3| 셀린: 3



// ========== 2 ======== 참조타입의 캡처 / 캡처리스트

class SomeClass {
    var num = 0
    var clousure = refTypeCapture
}

var x = SomeClass()
var y = SomeClass()

print(x.num, y.num)


let refTypeCapture = { [weak x] in
    guard let x = x else {return}
    print(x.num, y.num)
}

x.num = 1
y.num = 2


print(x.num, y.num) // 헤일리: 1 2 | 리디아:1 2 | 셀린: 1 2


refTypeCapture() // 헤일리:  | 리디아:1 2 | 셀린:

