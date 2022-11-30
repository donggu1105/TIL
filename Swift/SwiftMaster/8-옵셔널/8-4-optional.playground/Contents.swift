import UIKit

/*:
 ## 암시적 추출 옵셔널 - IUO 타입
 ## (Implicitly Unwapped Optional)
* 타입 선언시에 !가 붙어있는 타입 (Int!)
---
*/
// (특정상황에서) 벗겨질 준비가 되어있는 타입 ⭐️
// ===> 옵셔널 타입이 아닌 다른 변수에 담을 때, 자동으로 벗겨서 저장이 됨

var number: Int! = 7            // Int!
                                // 값을 저장하지 않을 때 nil로 초기화됨
print(number)  // Optional(7)   // "실제 사용시에 강제로 벗겨지는 건 아니다"


//:> 암시적 추출 옵셔널타입: (제한적인 상황에서) 옵셔널 바인딩이 필요없음

//⭐️ 옵셔널이 아닌 타입의 변수로 저장될때, 자동으로 언래핑 됨⭐️
var number2: Int = number     // (제한적인 특정상황)
print(number2)   // 7
     

// 일반 변수에 복사해서 담으면 ===> Int?
var number3 = number          // 형식추론을 사용하는 경우 자동으로 추출되지 않음
print(number3)   // Optional(7)


var number4 = number!         // (명시적으로) 강제로 벗기거나, 옵셔널 바인딩도 가능
print(number4)





var name: String! = "홍길동"
name.count     // 값이 있는 경우에만, 옵셔널 체이닝을 하지 않아도 되지만(값이 없을땐 에러 발생)



/*:
---
* 연습
---
*/
// 1) 일반적인 옵셔널 타입 =========================

let optionalString: String? = "String"
print(optionalString)


// 옵셔널 타입이 아닌 변수에 담으려면(벗겨서 담아야함)

let forcedString: String = optionalString!
print(forcedString)

// (1) 확인후, 강제로

if optionalString != nil {
    print(optionalString!)
}

// (2) if let 바인딩

if let undefiniteString = optionalString {
    print(undefiniteString)
}



// 2) IUO 타입 ===============================


// (제한적인 상황에서) 벗겨질 준비가 되어있는 타입

let unwrappedString: String! = "String"
print(unwrappedString)                    // Optional("String")

let normalString: String = unwrappedString     //  ⭐️ 특정상황 ⭐️
print(normalString)



// Int?     ====>   Int
// String?  ====>   String



// 하지만, 일반적인 방법처럼 언래핑해서 사용해도 됨

if let definiteString = unwrappedString {
    print(definiteString)
}




/*:
 ## 암시적 추출 옵셔널의 사용
* 왜 알아야 할까?
---
*/
/**===================================================================
- 실제 앱 구현 시,

- 1) (스토리보드에서 IBOutlet 연결할때) 실제 위와 같은 타입으로 자동으로 선언됨
     (옵셔널 체이닝. 즉, 접근연산자를 사용할때 ?를 사용하지 않아도 됨)
     var label: UILabel!
 
- 2) API에서 IUO타입으로 리턴하는 경우가 있음

- Int! 타입은 그냥 Int? 타입으로 봐도 무방함 (그렇기에 문법적으로 읽을 수 있기만 하면 됨)
=====================================================================**/

/*:
---
* 실제 앱 구현시 IUO타입은 개발자가 실수할 가능성을 낮춰주는 역할
---
*/
//:> 암시적 추출 옵셔널타입: 옵셔널 체이닝이 필요없음

class MyViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(systemName: "pencil")
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
    }
}






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
