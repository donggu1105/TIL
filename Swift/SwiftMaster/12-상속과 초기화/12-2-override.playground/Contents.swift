import UIKit



/*:
## 2) 재정의(Overriding)
 * 오버로딩(overloading) vs 오버라이딩(overriding)
 ---
 */
/**==============================================================================
 - 오버로딩(overloading) - (엉어 뜻: 과적) 함수에서 함수의 하나의 이름에 여러 함수를 대응시켜서 사용
 - 오버라이딩(overriding) - (영어 뜻: 재정의) 클래스의 상속에서 상위클래스의 속성/메서드를 재정의(기능을 약간 변형하여 사용)하는 것

 - 재정의
 - 서브클래스에서 슈퍼클래스의 동일한 멤버를 변형하여 구현

 - 재정의 가능한 대상(멤버)
 - 1) 속성 (하지만, 저장 속성에 대한 재정의는 어떠한 경우에도 불가능)
 - 2) 메서드 (메서드, 서브스크립트, 생성자)

    ==> 속성과 메서드는 재정의 방식이 다름 ⭐️
 ==============================================================================**/


class Aclass {
    func doSomething() {
        print("Do something")
    }
}


class Bclass: Aclass {
    override func doSomething() {
        print("Do another job")
    }
}



//:> 저장속성의 재정의는 원칙적 불가 (데이터 구조의 변형은 불가)

/*:
---
* 재정의(overriding)의 기본 문법
---
*/

class SomeSuperclass {
    // 저장속성
    var aValue = 0
    
    // 메서드
    func doSomething() {
        print("Do something")
    }
}



class SomeSubclass: SomeSuperclass {
    // 저장속성의 재정의는 원칙적 불가
    //override var aValue = 3
    
    // 저장속성 ===> (재정의) 계산속성
    // 그러나, 메서드 형태로 부수적 추가는 가능
    override var aValue: Int {
        get {
            return 1
        }
        set {    // self로 쓰면 안됨
            super.aValue = newValue
        }
    }
    
    // 메서드는 (어떤 형태로든)재정의 가능 ===> 변형 / 대체
    override func doSomething() {
        super.doSomething()
        print("Do something 2")
        //super.doSomething()
    }
}




/*:
## 2-1) 재정의 방식
*/
/*:
---
* 1) 속성의 재정의 (엄격)
---
*/
/**===============================================================================================
 - (타입/인스턴스 속성을 구분해서 생각해야 하지만, 실질적으로 타입 속성을 재정의 하는 것은 드문 일이므로 배제하고 생각하면 됨)


 - (1) 저장 속성의 재정의
 - 원칙적으로 불가능(고유의 메모리 공간은 유지 해야함)
 -  ==> 저장 속성은 고유의 메모리 공간이 있으므로 하위클래스에서 고유의 메모리 공간을 바꾸는 방식으로의 재정의는 불가능

 - (메서드 형태로 추가하는 방식의 재정의는 가능)
 -  ==> 읽기/쓰기 가능한 계산속성으로 재정의 가능(메서드) (읽기만 가능한 계산 속성으로 정의 불가능 - 기능 축소는 불가능 X)
 -  ==> 속성 감시자를 추가는 가능(메서드) (실질적 단순 메서드를 추가해서 저장 속성이 변하는 시점을 관찰할뿐)


 - (2) 계산 속성(메서드)의 재정의
 - (실질적인 메서드이기 때문에 메서드 형태로의 재정의만 가능. 기능의 범위를 축소하는 형태로의 재정의는 불가능)
 
 - (상위)읽기전용 계산 속성을 ===> (하위)읽기/쓰기가 가능한 가능한 속성으로 재정의 가능(확장 O)
 -                      ===> 속성 감시자를 추가하는 재정의는 불가능 (읽기 전용 속성을 관찰 할 수 없음 - 논리에 안 맞음)
 - (상위)읽기/쓰기 계산 속성을 ===> (하위)읽기만 가능한 가능한 속성으로만 재정의 불가능(기능 제한 X)
 -                      ===> 속성 감시자를 추가하는 재정의 가능 (관찰은 가능)

   ===================================
   - 읽기 메서드 ===> 읽기 메서드
   - 쓰기 메서드 ===>    x      (불가능)

   - 읽기 메서드 ===> 읽기 메서드
   -    x     ===> 쓰기 메서드  (가능)   // 확장은 가능
   ===================================


 - ⭐️ 인스턴스 속성의 대원칙
 - 1) 저장 속성 재정의는 원칙적으로 불가능(하위 속성에서 상위 속성의 고유의 메모리 공간을 변형 불가).
      메서드 방식(계산 속성으로의 재정의 가능)으로 추가는 가능
 - 2) 계산 속성의 유지/확장은 가능, 축소는 불가능
 - 3) 속성 감시자(메서드)를 추가하는 재정의는 언제나 가능(실질적 단순 메서드 추가)
      (다만, 읽기전용 계산 속성을 관찰하는 것은 의미 없으므로 불가능)


 - (실질적으로 드뭄)
 - 타입 속성의 재정의 원칙
 - 1) 타입 저장 속성은 재정의 불가 - static키워드 (계산속성으로 재정의하거나, 속성 감시자를 추가하는 것도 불가능)
 - 2) 타입 계산 속성 - class 키워드인 경우 계산 속성 재정의 (확장방식) 가능.
 - 3) 재정의한 타입 저장/계산 속성에는 감시자 추가 원칙적으로 불가
===============================================================================================**/
/*:
---
* 2) 메서드의 재정의 (메서드, 스크립트, 생성자)- 타입/인스턴스 속성 관계 없음
---
*/
/**============================================================================================
 - 속성에 비해, 메서드의 재정의는 자유로운 편(⭐️다만, 생성자의 재정의는 메모리 생성 규칙이 존재하므로 뒤에서 따로 다룰 예정)

 - 상위 클래스 인스턴스 메서드 또는 타입 메서드 상관없이 기능을 추가하는 것도 가능하고,
 - 상위 기능을 무시하고 새롭게 구현 하는 것도 가능(제약 없음 - 메서드 이름만 동일하고 완전히 새롭게 구현 가능하다고 생각하면됨)


 - 다만, 기능을 추가하는 구현을 선택할시에 상위구현의 기능을 먼저 실행할지의 여부는 개발자의 선택
===============================================================================================**/


/*:
## 2-2) 재정의 예시
* 1) 속성의 재정의(엄격)
---
*/

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



class Bicycle: Vehicle {
    // 저장 속성 추가는 당연히 가능
    var hasBasket = false
    
    // 1) 저장속성 ===> ⭐️ 계산속성으로 재정의(메서드 추가) 가능
    override var currentSpeed: Double {
        // 상위 속성이기 때문에 super키워드 필요
        get {
            return super.currentSpeed       // 1.0
        }
        set {
            super.currentSpeed = newValue
        }
    }

    // 1) 저장속성 ===> ⭐️ 속성감시자를 추가하는 재정의(메서드 추가)는 가능
//    override var currentSpeed: Double {
//        // 상위 속성이기 때문에 super키워드 필요
//        willSet {
//            print("값이 \(currentSpeed)에서 \(newValue)로 변경 예정")
//        }
//        didSet {
//            print("값이 \(oldValue)에서 \(currentSpeed)로 변경 예정")
//        }
//    }
    
    // ⭐️ 계산속성을 재정의 가능 (super키워드 주의)
//    override var halfSpeed: Double {
//        get {
//            return super.currentSpeed / 2
//        }
//        set {
//            super.currentSpeed = newValue * 2
//        }
//    }
    
    // ⭐️ 계산속성을 재정의 하면서, 속성감시자 추가 가능 (속성감시자 부분 참고)
//    override var halfSpeed: Double {
//        willSet {
//            print("값이 \(halfSpeed)에서 \(newValue)로 변경 예정")
//        }
//        didSet {
//            print("값이 \(oldValue)에서 \(halfSpeed)로 변경 예정")
//        }
//    }
    
}



/*:
---
* 2) 메서드의 재정의
---
*/

class Vehicle1 {
    var currentSpeed = 0.0
    
    var datas = ["1", "2", "3", "4", "5"]
    
    func makeNoise() {
        print("경적을 울린다.")
    }
    
    subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "0"
            }
            return datas[index]
        }
        set {
            datas[index] = newValue
        }
    }
}


// 메서드의 재정의 방식 ⭐️

class Bicycle1: Vehicle1 {
    
    // 1) 상위 => 하위 호출 (가능)
//    override func makeNoise() {
//        super.makeNoise()
//        print("자전거가 지나간다고 소리친다.")
//    }
    
    // 2) 하위 => 상위 호출 (가능)
//    override func makeNoise() {
//        print("자전거가 지나간다고 소리친다.")
//        super.makeNoise()
//    }
    
    // 3) 상위구현 아예 무시 (가능)
    override func makeNoise() {
        print("경적을 울리고, 자전거가 지나간다고 소리친다.")
    }
    
    // 서브스크립트도 재정의 가능
    override subscript(index: Int) -> String {
        get {
            if index > 4 {
                return "777"
            }
            return super[index]
        }
        set {
            super[index] = newValue
        }
    }
}


let v = Bicycle1()
v.currentSpeed
v.makeNoise()
//v[0]



/*:
## 2-3) 메모리 구조를 통한 이해
* 상속과 재정의(Overriding) 그리고 메모리 구조
---
*/
/**================================================================
 - 재정의(overriding) - 현재의 클래스에 맞게 상위 멤버를 변형시키서, 사용 하려는 것


 - 대원칙:
 - 1) 저장 속성 재정의 불가
 - 2) 메서드는 자유롧게 재정의 가능(다만, 기능 확장만 가능 - 기능 축소 불가의 의미)

 - (재정의를 하지 않아도, 상속에서는 당연히 모든 멤버의 상속이 일어남)
 

 - 저장 속성은 실제 인스턴스에 각각의 멤버별(속성별로) 저장공간이 있고,
 - 변형하는 것이 불가 (상속의 기본 원칙)

 - 메서드는 타입(데이터 영역)에만 배열형태로 주소값을 저장되어 존재하므로
 - 각 상속단계에서 재정의 되고 대체 되는 것이 당연
==================================================================**/









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
