import UIKit


/*:
 ## 메모리 누수(Memory Leak)현상의 해결
 * 1 - 약한 참조(Weak Reference)
 ---
 */

class Dog {
    var name: String
    weak var owner: Person?     // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


class Person {
    var name: String
    weak var pet: Dog?         // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var bori: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")


// 강한 참조 사이클이 일어나지 않음
bori?.owner = gildong
gildong?.pet = bori



// 메모리 해제가 잘됨(사실 이 경우 한쪽만 weak으로 선언해도 상관없음)
bori = nil
gildong = nil



//:> 약한 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화 되어있음
// nil로 설정하고 접근하면 ===> nil

//gildong = nil
//bori?.owner   // gildong만 메모리 해제시켰음에도 ===> nil




/*:
 ---
 * 2 - 비소유 참조(Unowned Reference)
 ---
 */

class Dog1 {
    var name: String
    unowned var owner: Person1?    // Swift 5.3 이전버전에서는 비소유참조의 경우, 옵셔널 타입 선언이 안되었음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person1 {
    var name: String
    unowned var pet: Dog1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var bori1: Dog1? = Dog1(name: "보리1")
var gildong1: Person1? = Person1(name: "홍길동1")


// 강한 참조 사이클이 일어나지 않음
bori1?.owner = gildong1
gildong1?.pet = bori1



// 메모리 해제가 잘됨(사실 이 경우 한쪽만 unowned로 선언해도 상관없음)
bori1 = nil
gildong1 = nil



//:> 비소유 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화 되지 않음
// nil로 설정하고 접근하면 ===> 에러 발생

// 1) 에러발생하는 케이스

//gildong1 = nil
//bori1?.owner   // nil로 초기화 되지 않음 에러 발생


// 2) 에러가 발생하지 않게 하려면

//gildong1 = nil
//bori1?.owner = nil      // 에러 발생하지 않게 하려면, nil로 재설정 필요 ⭐️
//bori1?.owner








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


