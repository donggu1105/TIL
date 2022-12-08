import UIKit

func closureParamFunction(closure: () -> Void) {
    print("print started")
    
    closure()
}



func printStopped() {
    print("print stopped")
}


closureParamFunction(closure: printStopped)


