import UIKit


func closureParamFunction(a:Int, closure: () -> Void) {
    print(a)
    closure()
}

closureParamFunction (a: 3) {
    print("closure")
}

func test (a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}


test(a: 2, b: 4) {number in print(number)}


func performClosure(param: (String) -> Int) {
    param("Swift")
}


performClosure {
         $0.count
}

let testClosure = {(a: Int, b: Int) -> Int in return a * b}

let testClosure1: (Int, Int) -> Int = {$0 * $1}




Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    print(1)
}
