import Foundation

// ========== 1 ======== 값타입의 캡처 / 캡처리스트

var num = 8

let valueCaptureClousure = {
    print(num)
}

num = 1

valueCaptureClousure() // ?

num = 3

valueCaptureClousure() // ?


let valueCaptureListClosure = { [num] in
    print(num)
}

num = 7

valueCaptureListClosure() // ?



// ========== 2 ======== 참조타입의 캡처 / 캡처리스트

class SomeClass {
    var num = 0
}

var x = SomeClass()
var y = SomeClass()

print(x.num, y.num)


let refTypeCapture = { [x] in
    print(x.num, y.num)
}

x.num = 1
y.num = 2


print(x.num, y.num) // ?


refTypeCapture() // ? 

