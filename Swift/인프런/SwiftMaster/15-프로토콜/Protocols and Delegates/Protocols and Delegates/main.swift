

// 자격증(정의)
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}


// 리모콘 클래스
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


// TV 구조체
struct TV: RemoteControlDelegate {

    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("TV의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("TV의 채널이 내려간다.")
    }
}



let rc1 = RemoteControl()
let samsungTV = TV(remote: rc1)   // TV에 리모콘 설정

rc1.channelUp()                   // 리모콘 실행
rc1.channelDown()                 // 리모콘 실행



// SmartPhone 클래스
class SmartPhone: RemoteControlDelegate {

    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("스마트폰의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("스마트폰의 채널이 내려간다.")
    }
}



// 새로운 리모콘2
let rc2 = RemoteControl()


// 소니TV ===> 현재의 리모콘2의 실행역할(delegate = self)

let sonyTV = TV(remote: rc2)
//rc2.channelUp()                 // 리모콘 실행
//rc2.channelUp()                 // 리모콘 실행



// 아이폰 ===> 현재의 리모콘2의 실행역할(delegate = self)

let iphone = SmartPhone(remote: rc2)
//rc2.channelUp()                 // 리모콘 실행
//rc2.channelUp()                 // 리모콘 실행




