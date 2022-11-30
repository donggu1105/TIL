import UIKit


/*:
# Part11 - 2 구조체, 클래스의 속성
*/
/*:
 ## 1) 저장속성(Stored Properties) / 지연 저장 속성
 * 1-1) 저장 속성(Stored Properties)
 ---
 */
//:> 값이 저장되는 일반적인 속성(변수)을 저장 속성이라고 함
// 그동안 우리가 배운 속성은 정확한 의미에서 "저장 속성"이었음 ====> 앞으로 저장 속성이 아닌 것을 배우게 됨


struct Bird {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {    // 기본값이 없으면, 생성자를 통해 값을 반드시 초기화해야함
        self.name = name
        self.weight = weight
    }
    
    func fly() {
        print("날아갑니다.")
    }
}



var aBird = Bird(name: "참새1", weight: 0.2)

aBird.name
aBird.weight = 0.3



var bBird = Bird(name: "참새2", weight: 0.3)

bBird.name
bBird.weight




/*:
---
* 주의점
---
*/
/**================================================================================
 - 저장 속성 ===> 구조체, 클래스 동일

 - let(상수) 또는 var(변수)로 선언 가능
   (만약 저장 속성을 let으로 선언하면 값을 바꿀 수 없음)

 - 저장 속성(변수)은 각 속성자체가 고유의 메모리 공간을 가짐 ⭐️
 - (앞에서 배웠던 것처럼) 초기화 이전에 값을 가지고 있거나, 생성자 메서드를 통해 값을 반드시 초기화 해야만 함
==================================================================================**/



/*:
---
* 1-2) 지연 저장 속성(Lazy Stored Properties)
---
*/

struct Bird1 {
    var name: String
    lazy var weight: Double = 0.2
    
    init(name: String) {
        self.name = name
        //self.weight = 0.2
    }
    
    func fly() {
        print("날아갑니다.")
    }
}



var aBird1 = Bird1(name: "새")   // weight 속성 초기화 안됨
aBird1.weight  // <============ 해당 변수에 접근하는 이 시점에 초기화됨 (메모리 공간이 생기고 숫자가 저장됨)




/**===========================================================
 - 저장 속성은 저장 속성인데, 지연(lazy)의 의미가 뭘까?

 - 지연 저장 속성은 "해당 저장 속성"의 초기화를 지연시키는 것임
 - 즉, 인스턴스가 초기화되는 시점에 해당 속성이 값을 갖고 초기화되는
   것이 아니라(메모리에 공간과 값을 갖는 것이 아니라),
 - 해당 속성(변수)에 접근하는 순간에 (해당 저장 속성만)개별적으로 초기화됨

 - 따라서, 상수로의 선언은 안되고 변수(var)로의 선언만 가능
   ➡︎ lazy var만 가능(lazy let 불가능)

 - 즉, 위의 weight이라는 속성은 초기화 시점에 메모리 공간이 생기는 것이 아님
 - 예를 들어, 인스턴스가 생기고 난 후, aBird.weight 이렇게 접근하는
   순간 메모리 공간을 만들고 숫자를 저장 하게됨
=============================================================**/



/*:
---
* 주의점
---
*/
//:> 지연 저장 속성은 "선언시점에 기본값을 저장"해야함
/**==============================================================
 - 따라서, 생성자에서 초기화를 시키지 않기 때문에 "선언시점에 기본값을 저장"해야함

 - 지연(lazy) 저장 속성 ===> 구조체, 클래스 동일
 - 값을 넣거나, 표현식(함수 실행문)을 넣을수 있음(모든 형태의 표현식)
 - 함수호출 코드, 계산코드, 클로저 코드 등도 모두 가능
   ===> 저장하려는 속성과 "리턴형"만 일치하면 됨
 - 지연 저장 속성으로 선언된  "해당 속성"의 초기화 지연.
   ===> 메모리 공간이 없다가 처음 접근하는 순간에 (해당 속성만)개별적으로 초기화됨
================================================================*/



/*:
---
* 실제, 지연 저장 속성을 사용하는 이유?
---
*/
// 이해가 안된다면, 지금은 이해가 안되어도 괜찮음


class AView {
    var a: Int
    
    // 1) 메모리를 많이 차지할때
    lazy var view = UIImageView()     // 객체를 생성하는 형태
    
    // 2) 다른 속성을 이용해야할때(다른 저장 속성에 의존해야만 할때)
    lazy var b: Int = {
        return a * 10
    }()
    
    init(num: Int) {
        self.a = num
    }
}


/**====================================================
 - 지연 저장 속성을 사용하는 이유

 - 1)
 - 메모리 공간을 많이 차지하는 이미지 등의 속성에 저장할때,
 - (반드시 메모리에 다 올릴 필요가 없으므로) 지연 저장 속성으로
   선언 함 (메모리 낭비 막기 위함)

 - 2)
 - 다른 속성들을 이용해야 할때
 - 초기화 시점에 모든 속성들이 동시에 메모리 공간에 저장되므로
 - 어떤 한가지 속성이 다른 속성에 접근할 수가 없다.
 - (그렇지만, 지연 저장 속성을 이용 하는 경우 지연으로 저장된 속성은
   먼저 초기화된 속성에 접근 할 수 있게됨)

 
 - 실제 프로젝트에서 많이 활용
 - 실제 프로젝트를 다루면서 자연스럽게 이해되는 내용이므로
   (프로젝트 다룰 때 설명 예정)

 - (클로저의 실행문 부분도 연결해서 설명 예정)
======================================================**/






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
