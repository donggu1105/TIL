import UIKit



// 자격증(정의) (텍스트필드 프로토콜)
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}


// 리모콘 클래스(텍스트필드의 역할 - 직접적으로 유저와 커뮤니케이션)
class RemoteControl {
    
    var delegate: RemoteControlDelegate?
    
    func doSomething() {
        print("리모콘의 조작이 일어나고 있음")
    }
    
    func channelUp() {   // 어떤 기기가 리모콘에 의해 작동되는지 몰라도 됨
        delegate?.channelUp()
    }
    
    func channelDown() {   // 어떤 기기가 리모콘에 의해 작동되는지 몰라도 됨
        delegate?.channelDown()
    }
}


// TV 클래스(뷰컨트롤러의 역할 - 리모콘과 커뮤니케이션)
class TV: RemoteControlDelegate {
    
    func channelUp() {
        print("TV의 채널이 올라간다.")
    }

    func channelDown() {
        print("TV의 채널이 내려간다.")
    }

}



let remote = RemoteControl()
let samsungTV = TV()

remote.delegate = samsungTV



remote.channelUp()        // 리모콘 실행 ====> delegate?.channelUp()
remote.channelDown()      // 리모콘 실행 ====> delegate?.channelDown()






// SmartPhone 클래스(뷰컨트롤러의 역할 - 리모콘과 커뮤니케이션)
class SmartPhone: RemoteControlDelegate {

    init(remote: RemoteControl) {
        remote.delegate = self       // remote.delegate = smartPhone
    }
    
    func channelUp() {
        print("스마트폰의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("스마트폰의 채널이 내려간다.")
    }
}



let smartPhone = SmartPhone(remote: remote)
remote.channelUp()        // 리모콘 실행 ====> delegate?.channelUp()
remote.channelDown()      // 리모콘 실행 ====> delegate?.channelDown()
