import UIKit


/*:
## 실패가능 생성자
 * 실패가능 생성자(Failable Initializers) - init?(파라미터)
 ---
 */
/**============================================================================
 - 실패가능 생성자는 인스턴스 생성에 실패할 수도 있는 가능성을 가진 생성자 (클래스, 구조체, 열거형 가능)
   (실패가 불가능하게 만들어서, 아예 에러가 나고 앱이 완전히 꺼지는 가능성보다는
    실패가능 가능성 생성자를 정의하고 그에 맞는 예외 처리를 하는 것이 더 올바른 방법임)

 - 생성자에 ?를 붙여서 init?(파라미터) 라고 정의하면 실패가능 생성자로 정의되는 것임
   (다만, 동일한 파라미터를 가진 생성자는 유일해야함. 오버로딩으로 실패가능/불가능을 구분 짓지 못함)
===============================================================================**/



struct Animal {
    let species: String
    
    // 실패가능 생성자
    init?(species: String) {
        if species.isEmpty {
            return nil            // 생성자 내에서 실패 가능 부분에 nil을 리턴하면 됨  (문법적 약속)
        }
        self.species = species
    }
    
}


let a = Animal(species: "Giraffe")    // ====> 인스턴스 생성

let b = Animal(species: "")           // 문자열이기에 유효한 타입이지만 =====> nil



// 엄밀히 말하면 생성자는 값을 반환하지 않고, 초기화가 끝날 때까지 모든 저장 속성이 값을 가져 올바르게 초기화되도록하는 것임
// 초기화 성공을 나타 내기 위해 return 키워드를 사용하지 않음 (문법적 약속)




/*:
---
* 열거형의 실패가능 생성자 활용
---
*/

enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = TemperatureUnit.kelvin
        case "C":
            self = TemperatureUnit.celsius
        case "F":
            self = TemperatureUnit.fahrenheit
        default:
            return nil
        }
    }
}


let c: TemperatureUnit = TemperatureUnit.celsius      // TemperatureUnit()

let f: TemperatureUnit? = TemperatureUnit(symbol: "F")



// 열거형의 원시값 설정 (실패가능 생성자의 구현과 유사)

enum TemperatureUnit1: Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}


// 원시값이있는 열거형은 자동으로 실패가능 생성자 init?(rawValue :)를 구현함 ==> 일치하면 인스턴스 생성, 아니면 nil

 
let f1: TemperatureUnit1? = TemperatureUnit1(rawValue: "F")     // .fahrenheit

let u: TemperatureUnit1? = TemperatureUnit1(rawValue: "X")      // nil




/*:
---
* 1) 초기화 실패의 전달 (호출관계)
---
*/
/**============================================================
 - (한마디로) 실패불가능 생성자는 다른 실패가능 생성자를 호출 불가능 ⭐️
 
 (동일단계 - 델리게이트 어크로스)
 - 실패가능  ===> 실패불가능  (호출/위임) (OK)
 - 실패불가능 ===> 실패가능   (호출/위임) (X)
 
 (상속관계 - 델리게이트 업)
 - (상위)실패가능  <=== (하위)실패불가능  (호출/위임)  (X)
 - (상위)실패불가능 <=== (하위)실패가능   (호출/위임)  (OK)
 

 - 두 경우 모두 초기화 실패를 유발하는 다른 생성자에 위임하면
 - 전체 초기화 프로세스가 즉시 실패하고 더 이상 초기화 코드가 실행되지 않음
==============================================================**/


// 상속관계에서의 호출 예제

// 상품

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


// 온라인 쇼핑 카트의 항목을 모델링

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }     // 상품의 갯수가 1보다 작으면 ====> 카트 항목 생성 실패
        self.quantity = quantity           // 수량이 한개 이상이면 ====> 초기화 성공
        super.init(name: name)             // "" (빈문자열이면)  ====> 실패 가능 위임 OK
    }
}



if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("아이템: \(twoSocks.name), 수량: \(twoSocks.quantity)")
}



if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("아이템: \(zeroShirts.name), 수량: \(zeroShirts.quantity)")
} else {
    print("zero shirts를 초기화 불가(갯수가 없음)")
}



if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("아이템: \(oneUnnamed.name), 수량: \(oneUnnamed.quantity)")
} else {
    print("이름없는 상품 초기화 불가")
}




/*:
---
* 2) (상속관계에서) 재정의 하기
---
*/
/**===============================================================
 - (상위)실패가능  ===> (하위)실패불가능  재정의 (OK)  (강제 언래핑 활용 가능)
 - (상위)실패불가능 ===> (하위)실패가능   재정의  (X)
 ===============================================================**/
//:> 범위로 따져보기(실패가능 생성자의 범위가 더 큼)


// 서류라는 클래스 정의

class Document {
    
    var name: String?
    
    init() {}                // 서류 생성 (실패불가능) (이름은 nil로 초기화)
    
    init?(name: String) {    // 실패가능 생성자 ===> 이름이 "" 빈문자열일때, 초기화 실패(nil)
        if name.isEmpty { return nil }
        self.name = name
    }
}


// 자동으로 이름지어지는 서류

class AutomaticallyNamedDocument: Document {
    
    override init() {                // 재정의 (상위) 실패불가능 =====> (하위) 실패불가능
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {    // 재정의 (상위) 실패가능 =====> (하위) 실패불가능
        super.init()                 // 실패불가능 활용가능
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}


let autoDoc = AutomaticallyNamedDocument(name: "")
autoDoc.name



// 이름없는(Untitled) 서류

class UntitledDocument: Document {
    
    override init() {               // 재정의 (상위) 실패가능 =====> (하위) 실패불가능
        //super.init()
        super.init(name: "[Untitled]")!    // 강제 언래핑(!)으로 구현 ⭐️
    }
}





/*:
---
* 실패가능 생성자를 init!(파라미터)로 정의하기
---
*/
/**=========================================================================
 - 일반적으로 init 키워드 (init?) 뒤에 물음표를 배치하여 적절한 유형의 선택적 인스턴스를 생성하는
   실패 가능한 이니셜 라이저를 정의함. 또는 적절한 유형의 암시적으로 래핑되지 않은 선택적
   인스턴스를 만드는 실패 가능한 이니셜 라이저를 정의 할 수 있음.
   
 - 물음표 대신 init 키워드 (init!) 뒤에 느낌표

  ================================
 - init? ====> init! 위임 가능
 - init! ====> init? 위임 가능

 - init? ====> init! 로 재정의 가능
 - init! ====> init? 로 재정의 가능
 =================================


 - init ====> init! 위임 가능 (실패할 수도 있어짐) ⭐️
=============================================================================**/







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
