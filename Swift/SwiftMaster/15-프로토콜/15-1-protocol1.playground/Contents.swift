import UIKit


/*:
 # Part15 - 프로토콜(Protocols)
 */
/*:
 ## 프로토콜(Protocols)
 * 프토토콜의 필요성에 대한 인식
 ---
 */
//:> 프로토콜: 영어로 규약 / 협약
// 프로토콜? 규약/협약(약속)  ======> "자격증" / "리모콘"
// 프로토콜이 뭔지, 무엇을 가능하게 만들까? 왜 프로토콜의 개념이 필요할까?

// 정의

protocol SomeProtocol {     // 요구사항을 정의 (자격증의 필수 능력만 정의)
    func playPiano()
}



// 채택 및 구현

// 구조체에서 채택
struct MyStruct: SomeProtocol {       // 이제 자격증의 능력이 생긴 것임
    func playPiano() {
        // 구체적인 구현
    }
}

// 클래스에서 채택
class MyClass: SomeProtocol {        // 이제 자격증의 능력이 생긴 것임
    func playPiano() {
        // 구체적인 구현
    }
}


// 따르면 ===> 능력을 갖게 된다.

/*:
 ---
 * 프토토콜의 필요성에 대한 인식 - 클래스와 상속의 단점 ⭐️
 ---
 */
// 예제

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
    
    func fly() {
        print("새가 하늘로 날아간다.")
    }
}


class Eagle: Bird {
    
    // isFamale
    // layEgg()
    // fly()
    
    func soar() {
        print("공중으로 치솟아 난다.")
    }
}


class Penguin: Bird {
    
    // isFamale
    // layEgg()
    
    // fly()       // 상속 구조에서는 펭귄이 어쩔 수 없이 날개됨 ⭐️
    
    func swim() {
        print("헤엄친다.")
    }
}


// struct가 될 수도 없고(클래스로만 구현가능), 무조건 Bird를 상속해야만 함
class Airplane: Bird {
    
    // isFamale
    // layEgg()         // 상속 구조에서는 비행기가 알을 낳게됨 ⭐️
    
    override func fly() {
        print("비행기가 엔진을 사용해서 날아간다")
    }
}


// 플라잉 박물관을 만듦

struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}


let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()


let myPenguin = Penguin()
myPenguin.layEgg()
myPenguin.swim()
myPenguin.fly()     // 문제 ===> 펭귄이 날개 됨(무조건적인 멤버 상속의 단점)


let myPlane = Airplane()
myPlane.fly()
myPlane.layEgg()         // 문제 ===> 비행기가 알을 낳음



let museum = FlyingMuseum()     // 타입 정의 ===> 오직 Bird 클래스 밖에 안됨
museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myPenguin)
museum.flyingDemo(flyingObject: myPlane)    // Bird를 상속해야만 사용 가능




/**======================================================================
 - 프로토콜은 위와 같은 상황을 해결해주는 해결책이다.

 - 1) "fly()"라는 동작을 따로 분리해내어서, 굳이 상속을 하지 않고도 사용가능하게 만들려면?
 - 2) 꼭 클래스가 아닌, 구조체에서도 "fly()"기능을 동작하게 하려면?
======================================================================**/

/*:
 ---
 * 프토토콜의 도입 - 클래스와 상속의 단점을 보완 ⭐️
 ---
 */
// "fly()"라는 기능을 따로 분리해 내기

protocol CanFly {
    func fly()      // 구체적인 구현은 하지 않음 ===> 구체적인 구현은 자격증을 채택한 곳에서
}



class Bird1 {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }

}


class Eagle1: Bird1, CanFly {    // "CanFly" 자격증을 채택
    
    // isFemale
    // layEgg()
    
    func fly() {
        print("독수리가 하늘로 날라올라 간다.")
    }
    
    func soar() {
        print("공중으로 활공한다.")
    }
}


class Penguin1: Bird1 {
    
    // isFemale
    // layEgg()
    
    func swim() {
        print("물 속을 헤엄칠 수 있다.")
    }
}


// 구조체에서 채택도 가능
struct Airplane1: CanFly {
    func fly() {
        print("비행기가 날아간다")
    }
}



// 박물관을 만듦

struct FlyingMuseum1 {
    func flyingDemo(flyingObject: CanFly) {     // 중요한 기능 ===> 프로토콜을 타입으로 인식
        flyingObject.fly()
    }
}



let myEagle1 = Eagle1()
myEagle1.fly()
myEagle1.layEgg()
myEagle1.soar()


let myPenguin1 = Penguin1()
myPenguin1.layEgg()
myPenguin1.swim()
//myPenguin1.fly()     // 더이상 펭귄이 날지 않음


let myPlane1 = Airplane1()
//myPlane1.layEgg()         // 더이상 비행기가 알을 낳지 않음
myPlane1.fly()


let museum1 = FlyingMuseum1()
museum1.flyingDemo(flyingObject: myEagle1)
//museum1.flyingDemo(flyingObject: myPenguin1)   // 더이상 "CanFly"자격증이 없는 펭귄은 날지 못함
museum1.flyingDemo(flyingObject: myPlane1)





// 예제 출처 (유데미 - 안젤라 님 강의)
// https://www.udemy.com/course/ios-13-app-development-bootcamp/








//Copyright (c) 2021 we.love.code.allen@gmail.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//distribute, sublicense, create a derivative work, and/or sell copies of the
//Software in any work that is designed, intended, or marketed for pedagogical or
//instructional purposes related to programming, coding, application development,
//or information technology.  Permission for such use, copying, modification,
//merger, publication, distribution, sublicensing, creation of derivative works,
//or sale is expressly withheld.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.



