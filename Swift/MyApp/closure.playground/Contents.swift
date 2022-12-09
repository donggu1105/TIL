import UIKit

var stored = 0

let closure = {(number:Int) -> Int in
    stored += number
    return stored
}

closure(3)
closure(4)
closure(5)


func calculate(number: Int) -> Int {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    let result = square(num: number)
    return result
}


calculate(number: 10)
calculate(number: 20)
calculate(number: 30)

var aSavedFunction: () -> () = {print("print")}


func performEscaping1(closure: () -> ()) {
    closure()
}

func performEscaping2(closure: @escaping () -> ()) {
    aSavedFunction = closure
}


performEscaping2 {
    print("different print")
}


aSavedFunction()


