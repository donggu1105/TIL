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
        return $0.count
}
