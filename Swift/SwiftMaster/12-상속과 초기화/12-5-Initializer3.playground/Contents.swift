import UIKit


/*:
 ## 클래스의 지정, 편의 생성자의 상속과 재정의
 * 생성자의 상속과 재정의
 ---
 */
/**====================================================================
 - 하위클래스는 기본적으로 상위클래스 생성자를 상속하지 않고, 재정의 하는 것이 원칙
 - (올바르게 초기화되지 않을 수 있는 가능성을 배제 - 하위클래스에 최적화 안되어 있음)
   ===> (안전한 경우에만) 상위클래스의 생성자가 자동 상속됨

 - 재정의 (동일한 이름을 가진 생성자를 구현하는 것)
 - 하위클래스의 커스텀 생성자 구현 전에 ⭐️(상위클래스의) 재정의 생성자를 작성해야 실수하지 않음 ⭐️
======================================================================== **/


//:> 생성자 상속시 구현 규칙
/**=============================================================
// ☑️ 원칙: 1) 상위의 지정생성자(이름/파라미터)와 2) 현재단계의 저장속성을 고려해서 구현 ⭐️⭐️

 
[1단계 - 상위 생성자에 대한 고려]

 - 상위에 어떤 지정 생성자가 존재하는지?
 - (상위) 지정 생성자 ===> 1) 하위클래스에서 지정 생성자로 구현 (재정의)
 -                ===> 2) 하위클래스에서 편의 생성자로 구현 가능 (재정의)
 -                ===> 3) 구현 안해도됨(반드시 재정의하지 않아도 됨)

 - (상위) 편의 생성자 ===> 재정의를 하지 않아도 됨 (호출 불가가 원칙이기 때문에 재정의 제공 안함)
 -                ===> (만약에 동일한 이름을 구현했다면) 그냥 새로 정의한 것임


[2단계 - (현재단계의) 생성자 구현]

 - 1) 지정 생성자 내에서
 -   ===> (1) 나의 모든 저장 속성을 초기화해야함
 -   ===> (2) 슈퍼 클래스의 지정 생성자 호출

 - 2) 편의 생성자 내에서
 -   ===> 현재 클래스의 지정생성자 호출 해야함 (편의 생성자를 거치는 것은 상관없음)
          (결국 지정 생성자만 모든 저장 속성을 초기화 가능)
===============================================================**/




// 기본(Base) 클래스

class Aclass {
    var x = 0
    
    // init() {}                // 기본 생성자가 자동으로 제공됨
}


let a = Aclass()
print("a 출력해보기 a.x: \(a.x)")



// 상위의 지정생성자 ⭐️
// init()


class Bclass: Aclass {
    
    var y: Int

    
    // 🎾 [1단계] 상위의 지정생성자 고려 ==============================
    // 상위에 동일한 이름이 있으므로 재정의 해야함 (이 형태는 안됨)
//    init() {
//
//    }
    
    // (선택 1) 지정생성자로 재정의
    override init() {       // 상위 클래스와 "이름이 동일한 생성자" 구현은 재정의만 가능함(올바른 재정의) (지정생성자로 구현)
        self.y = 0
        super.init()
    }
    
    
    // (선택 2) 서브클래스에서 편의생성자로 구현해보기
    // 상위 클래스와 "이름이 동일한 생성자" 구현은 재정의만 가능함(올바른 재정의) (지정생성자 필요)
//    override convenience init() {
//        self.init(y: 0)
//    }
    
    // (선택 3) 재정의 하지 않을 수도 있음 (상속안함)
    
    
    // 🎾 [2단계] (현재단계의) 생성자 구현 ============================
    
    init(y: Int) {
        self.y = y
        super.init()
    }

}



let b = Bclass()
print("b 출력해보기 b.x: \(b.x), b.y: \(b.y)")



// 상위의 지정생성자 ⭐️
// init()
// init(y: Int)


class Cclass: Bclass {
    
    var z: Int
    
    override init() {      // 상위 클래스와 "이름이 동일한 생성자" 구현(올바른 재정의)
        self.z = 0
        super.init()       // 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청)
    }
    
    init(z: Int) {
        self.z = z
        super.init()       // 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청)
    }
    
}



let c = Cclass()
print("c 출력해보기 c.x: \(c.x), c.y: \(c.y), c.z: \(c.z)")

let d = Cclass(z: 1)
print("d 출력해보기 d.x: \(d.x), d.y: \(d.y), d.z: \(d.z)")




/*:
 ---
 * 애플 공식 문서의 예제로 복습
 ---
 */

class Vehicle {
    
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    
    // init() { }
}


// numberOfWheels의 저장 속성에 기본값을 제공, 생성자 구현하지 않았으므로
// ===> 기본 생성자 init() 자동제공


let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")    // Vehicle: 0 wheel(s)



// 상위의 지정생성자 ⭐️
// init()


// 서브클래스 정의

class Bicycle: Vehicle {
    
    override init() {
        super.init()            // 수퍼클래스 호출 반드시 필요
        numberOfWheels = 2      // 초기화의 2단계 값설정
    }
    
}


// 커스텀 init() 정의 ===> 생성자가 상위클래스의 이름과 동일 하므로 재정의 키워드 필요
// 상위 지정생성자 호출하여 메모리 초기화 후, 상위에서 구현한 속성에 접근하여 2로 셋팅(2단계 값설정)



let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")    // Bicycle: 2 wheel(s)




// 상위의 지정생성자 ⭐️
// init()



// 서브클래스 정의

class Hoverboard: Vehicle {
    
    var color: String
    
    // (읽기) 계산 속성 재정의
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
    
//    override convenience init() {
//        self.init(color: "빨간색")
//    }
    
    init(color: String) {
        self.color = color      // (현재 클래스) 저장 속성 초기화
        super.init()          // =====> 여기서 암시적으로 호출됨
    }
    
}


// 생성자에서 Hoverboard 클래스는 색상 속성만 설정
// 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청) ⭐️



let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")     // Hoverboard: 0 wheel(s) in a beautiful silver








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
