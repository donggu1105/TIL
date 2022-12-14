import UIKit


/*:
## 필수 생성자
 * 필수 생성자(Required Initializers)
 ---
 */

class Aclass {
    var x: Int
    required init(x: Int) {
        self.x = x
    }
}


// 클래스 생성자 앞에 required(요구된/필수의) 키워드 사용시
// 하위 생성자는 반드시 해당 필수 생성자를 구현 해야함



class Bclass: Aclass {
//    required init(x: Int) {
//        super.init(x: x)
//    }
}


// 하위 클래스에서 필수생성자를 구현할 때는, 상위 필수생성자를 구현하더라도
// override(재정의) 키워드가 필요없고, required 키워드만 붙이면 됨


//:> 필수생성자 자동 상속 조건: 다른 지정 생성자 구현 안하면 ➞ 자동 상속
// (자동상속 조건을 따르기 때문에, 다른 지정 생성자 구현 안하면 자동으로 필수생성자 상속됨)




class Cclass: Aclass {
    init() {
        super.init(x: 0)
    }
    
    required init(x: Int) {
        super.init(x: x)       // 호출시 required init으로 호출하지 않음
    }
}


// init() 생성자를 구현하면, 자동 상속 조건을 벗어나기 때문에
// required init(x: Int) 필수생성자 구현해야 함



/*:
 ---
 * 필수 생성자 사용 예시 (UIView)
 ---
 */
class AView: UIView {
//    required init?(coder: NSCoder) {         // 구현을 안해도 자동상속
//        fatalError("init(coder:) has not been implemented")
//    }
}


class BView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
