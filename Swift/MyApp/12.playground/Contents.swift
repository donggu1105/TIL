import UIKit

struct MyStruct {
    
    func method1() {print(1)}
    func method2() {print(2)}
}



let ms = MyStruct()

ms.method1() // 구조체인경우 바로 메모리주소 줘버림


class FirstClass {
    
    func method1() {print("class print 1")}
}




protocol MyProtocol {
    func method1()
    func method2()
    
}



extension MyProtocol {
    func method1() {print("protocol - witness table method1 is called")}
    func method2() {print("protocol - witness table method2 is called")}
    
    func anotherMethod() {print("protocol - extension direct method")}
}

let fomatter = DateFormatter()


fomatter.dateStyle = .full

fomatter.dateStyle = DateFormatter.Style.full




struct Calculator {
    var number: Int = 0
    
    mutating func plusNumber(_ num: Int) {
        number = number + num
    }
    
    mutating func reset() {
        self = Calculator()
    }
    
    
}
