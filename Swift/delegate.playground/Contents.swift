import UIKit

// 자격증(정의)
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}


// 리모콘 클래스 (직접적으로 유저와 커뮤니케이션)
class RemoteControl {
    
    var delegate: RemoteControlDelegate?
    
    func doSomething() {
        print("리모콘의 동작이 이루어지고 있음")
    }
    
    func channelUp() { // 어떤 기기가 리모콘에 의해 작동되는지 몰라도 됨
        delegate?.channelUp()
    }
    
    func channelDown() { // 어떤 기기가 리모콘에 의해 작동되는지 몰라도 됨
        delegate?.channelDown()
    }
    
}


class TV: RemoteControlDelegate {
    
    func channelUp() {
        print("TV channelUp")
    }
    
    
    func channelDown() {
        print("TV channelDown")
    }
}

let remote = RemoteControl()
let tv = TV()

remote.delegate = tv


remote.channelDown()


class SmartPhone: RemoteControlDelegate {
    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("SmartPhone channelUp")
    }
    
    
    func channelDown() {
        print("SmartPhone channelDown")
    }
}

let smartPhone = SmartPhone(remote: remote)
remote.channelUp()
remote.channelDown()



