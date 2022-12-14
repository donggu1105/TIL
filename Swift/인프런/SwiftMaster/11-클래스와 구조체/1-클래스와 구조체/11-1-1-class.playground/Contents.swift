import UIKit

/*:
# Part 11 - 클래스(Class)와 구조체(Struct)
*/
/*:
 ## 1) 클래스(Class)
 * 클래스의 정의와 객체의 생성
 ---
 */
// 붕어빵틀 만들기

class Dog {
    var name = "강아지"
    var weight = 0
    
    func sit() {
        print("앉았습니다.")
    }
    
    func layDown() {
        print("누웠습니다.")
    }
}




// 붕어빵 찍어내기 (객체의 생성)

var bori = Dog()


// 객체의 속성에 접근

bori.name
bori.name = "보리"
bori.name

bori.weight
bori.weight = 15
bori.weight

bori.sit()
bori.layDown()



// 붕어빵 찍어내기 (객체의 생성)

var choco = Dog()


// 객체의 속성에 접근

choco.name
choco.name = "초코"
choco.name

choco.weight
choco.weight = 10
choco.weight

choco.sit()
choco.layDown()





/*:
 ## 2) 구조체(Struct)
 * 구조체의 정의와 instance의 생성
 ---
 */
// 붕어빵틀 만들기

struct Bird {
    var name = "새"
    var weight = 0.0
    
    func fly() {
        print("날아갑니다.")
    }
}




// 붕어빵 찍어내기 (인스턴스의 생성)

var aBird = Bird()


// 인스턴스의 속성에 접근

aBird.name
//aBird.name = "참새1"
//aBird.name

aBird.weight
aBird.weight = 0.3
aBird.weight

aBird.fly()




// 붕어빵 찍어내기 (인스턴스의 생성)

var bBird = Bird()


// 인스턴스의 속성에 접근

bBird.name
bBird.name = "참새2"
bBird.name

bBird.weight
bBird.weight = 0.35
bBird.weight

bBird.fly()



/*:
---
* 클래스와 구조체
---
*/
/**=========================================================
 - 클래스와 구조체 둘다, 메모리에 찍어낸 것을 인스턴스(instance)라고 함
 - 인스턴스는 실제로 메모리에 할당되어 구체적 실체를 갖춘 것이라는 의미

 - 스위프트에서는 클래스의 instance를 특별히 객체(object)라고 부름

 - 클래스의 인스턴스(객체)
 - 구조체의 인스턴스
 - 열거형의 인스턴스


 - ⭐️ 가장 큰 차이는 메모리 저장 방식의 차이 ⭐️

 - 1) 구조체
    - 값형식(Value Type)
    - 인스턴스 데이터를 모두 스택(Stack)에 저장
    - (복사시) 값을 전달할때마다 복사본을 생성 (다른 메모리 공간 생성)
    - 스택(Stack)의 공간에 저장, 스택 프레임 종료시, 메모리에서 자동 제거
 
 - 2) 클래스
    - 참조형식(Reference Type)
    - 인스턴스 데이터는 힙(Heap)에 저장, 해당 힙을 가르키는 변수는 스택에 저장하고
    - 메모리 주소값이 힙(Heap)을 가르킴
    - (복사시) 값을 전달하는 것이 아니고, 저장된 주소를 전달
    - 힙(Heap)의 공간에 저장, ARC시스템을 통해 메모리 관리(주의해야함)
 ==========================================================**/


// 그렇지만 그 외의 면에서는 클래스와 구조체는 거의 동일하므로,
// 클래스와 구조체를 동시에 살펴볼 것 임.
//
// 특별하게 차이를 언급하지 않는 한,
// 클래스의 기능은 동일하게 구조체에서 가지고 있다고 보면 됨


/*:
---
* 클래스와 구조체의 메모리
---
*/
class Person {
    var name = "사람"
}



struct Animal {
    var name = "동물"
}




var p = Person()    // x1234
p.name

var a = Animal()
a.name



var p2 = p       // (클래스)     // x1234


//p.name = "혜리"

p.name
p2.name





var a2 = a       // (구조체)
a.name = "강아지"

a.name
a2.name




/*:
---
* 클래스와 구조체의 let과 var키워드
---
*/

class PersonClass {
    var name = "사람"
    var age = 0
}



struct AnimalStruct {
    var name = "동물"
    var age = 0
}



let pclass = PersonClass()
let astruct = AnimalStruct()



pclass.name = "사람1"
pclass.name



//astruct.name = "동물1"
astruct.name




/*:
---
* 접문법 / 명시적 멤버 표현식(Explicit Member Expression)의 정확한 의미
---
*/

// 내부의 요소. 즉, 클래스, 구조체의 인스턴스의 멤버에 접근한다.

// 멤버는 속성, 메서드를 포함



bBird.fly()


Int.random(in: 1...10)




/*:
---
* 관습적인 부분들에 대한 이해
---
*/
/**=====================================
 - 일반적으로 클래스, 구조체 선언할때 모두
 - 1) 속성 2) 메서드 순서대로 작성
=====================================**/


//:> 주의점 - (참고) 클래스 내부에는 직접 메서드(함수) 실행문이 올 수 없다. ⭐️
// 메서드 실행문은 메서드의 정의문 내에 존재해야함
// 처음 코딩하면서 자주 실수하는 부분임에 유의








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
