import UIKit

class Vehicle {
    
    var currentSpeed = 0.0
    
    var halfSpeed: Double {
        get {
            return currentSpeed / 2
        }
        set {
            currentSpeed = newValue * 2
        }
    }
}


class Bicylce: Vehicle {
    var hasBasket = false
    
    override var currentSpeed: Double {
        
//        get {
//            return super.currentSpeed
//        }
//        set {
//            super.currentSpeed = newValue
//        }
        
        didSet {
            print("\(oldValue) -> \(currentSpeed)")
            
        }
    }
}

var b = Bicylce()

b.currentSpeed = 2.0
