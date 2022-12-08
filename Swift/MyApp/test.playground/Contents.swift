import UIKit



protocol Remote {
    func turnOn()
    func turnOff()
}

extension Remote {
    
    func turnOn() {
        print("remote turn on")
    }
    func turnOff() {
        print("remote turn off")
    }
    func doAnotherAction() {
        print("remote do another action")
    }
}



class Ipad: Remote {
    func turnOn() {
        print("ipad turn on")
    }
    
    func doAnotherAction(){
        print("ipad do another action")
    }
}

let ipad: Remote = Ipad()

ipad.turnOn()
ipad.turnOff()
ipad.doAnotherAction() // direct    

 

