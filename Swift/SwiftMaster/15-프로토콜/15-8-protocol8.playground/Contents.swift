import UIKit


/*:
 ## 6) 프로토콜 확장의 적용 제한
 * (전 강의에서 다룬)프로토콜의 확장
 ---
 */
protocol Remote {
    func turnOn()        // 요구사항
    func turnOff()       // 요구사항
}


extension Remote {
    func turnOn() { print("리모콘 켜기") }
    func turnOff() { print("리모콘 끄기") }
}


/*:
 ---
 * 프로토콜 확장 - 형식을 제한 가능
 ---
 */
protocol Bluetooth {
    func blueOn()
    func blueOff()
}

/**====================================================
 - 프로토콜 확장에서 where절을 통해, 프로토콜의 확장의 적용을 제한 가능
 - "특정 프로토콜"을 채택한 타입에만 프로토콜 확장이 적용되도록 제한
    where Self: 특정프로토콜
 
 - 특정 프로토콜을 채택하지 않으면, 프로토콜의 확장이 적용되지 않기 때문에
   (확장이 없는 것과 동일하게) 메서드를 직접구현 해야함
=======================================================**/


// 특정 프로토콜을 채택한 타입에만 프로토콜 확장이 적용되도록 제한
// (Remote 프로토콜을 채택한 타입만 확장 적용 가능)
extension Bluetooth where Self: Remote {   // 본 확장의 적용을 제한시키는 것 가능 (구체적 구현의 적용범위를 제한)
    func blueOn() { print("블루투스 켜기") }
    func blueOff() { print("블루투스 끄기") }
}


// Remote프로토콜을 채택한 타입만 Bluetooth 확장이 적용됨
// Remote프로토콜을 채택하지 않으면 ===> 확장이 적용되지 않기 때문에 직접 구현 해야함
class SmartPhone: Remote, Bluetooth {
    
    
}





let sphone = SmartPhone()
sphone.turnOn()           // 리모콘 켜기
sphone.turnOff()          // 리모콘 끄기
sphone.blueOn()           // 블루투스 켜기
sphone.blueOff()          // 블루투스 끄기









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
