import UIKit


class Dog {
    var name = "choco"
    
    func doSomething() {
        // 비동기적으로 실행하는 클로저
        // 해당 클로전느 오래동안 저장할 필요가있음 ==> 새로운 스택을 만들어서 실행하기 때문
        DispatchQueue.global().async { [weak self] in
            print("나의 이름은 \(self?.name)")
        }
    }
    
    func doSomething2() {
        DispatchQueue.global().async {
            print("my name is \(self.name)")
        }
    }
}

var choco = Dog()
choco.doSomething()



