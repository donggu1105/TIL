import UIKit



 protocol Remote {
    func turnOn()
}

class TV: Remote {
}



extension Remote {
    func turnOn() {
        print("protocol extended")
    }
    
    func doAnotherAction(){
        print("another action is called")
    }
}


var tv = TV()

tv.turnOn()
