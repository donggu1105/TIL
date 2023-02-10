import Foundation

//// 1
protocol Remote {
   func turnOn()
   func turnOff()
}

extension Remote {
    func turnOn() { print("리모콘 켜기") }
    func turnOff() { print("리모콘 끄기") }
    func doAnotherAction() { print("리모콘 또 다른 동작") }
}

class TV: Remote {
    func turnOn() { print("TV 켜기") }
    func doAnotherAction() {print("TV 또 다른 동작")}
}

var tv: Remote = TV()
tv.turnOn() // TV 켜기 | 우리들의 예상 : 리모콘 켜기
tv.turnOff() // 리모콘 끄기
tv.doAnotherAction() // 리모콘 또 다른 동작

tv = tv as! TV // ====

tv.turnOn() // TV 켜기
tv.turnOff() // 리모콘 끄기
tv.doAnotherAction() // 리모콘 또 다른 동작



//// 2
///
let stringArray = ["A", nil, "B", nil, "C"]

var newStringArray = stringArray.filter { $0 != nil }
print(newStringArray) // 리디아: [옵셔널 ABC] | 헤일리: [A,B,C] // [Optional("A"), Optional("B"), Optional("C")]

newStringArray = newStringArray.map { $0! }
print(newStringArray) // 리디아: [옵셔널 ABC]  | 헤일리: ["A", nil, "B", nil, "C"]


let array = stringArray.compactMap {$0}

print(array) // ["A10", "", "B10", "", "C10"]


class A {
    var n : Int
    
    init(n: Int) {
        self.n = n
    }
}

let a = A(n:10)

print("1번쨰: \(a.n)")

a.n = 0

print("2번쨰: \(a.n)")
