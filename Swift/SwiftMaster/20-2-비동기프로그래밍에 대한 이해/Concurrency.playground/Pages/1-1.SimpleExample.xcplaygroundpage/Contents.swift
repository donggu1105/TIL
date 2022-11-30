//: [Previous](@previous)
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//: # 큐로 보내면 다른 쓰레드로 배치
//: ### 다른 쓰레드로 보낼 수있는 기본 코드 살펴보기


// "디폴트 글로벌큐 생성","비동기적으로"
DispatchQueue.global().async {
    
    //다른 쓰레드로 보낼 작업을 배치
    
}


//:> 클로저는 작업을 하나로 묶음
// 전체가 하나의 작업 ===> 내부적으로는 동기적으로 동작 ⭐️
DispatchQueue.global().async {
    print("Task1 시작")
    print("Task1-1")
    print("Task1-2")
    print("Task1-3")
    print("Task1 종료")
}




// 위의 코드랑 아래의 코드는 전혀다름... 순서를 보장할 수 없음
// 아래의 코드는 작업이 5개로 분할된 개념

DispatchQueue.global().async {
    print("Task2 시작")
}


DispatchQueue.global().async {
    print("Task2-1")
}

DispatchQueue.global().async {
    print("Task2-2")
}

DispatchQueue.global().async {
    print("Task2-3")
}

DispatchQueue.global().async {
    print("Task2 종료")
}









sleep(2)

PlaygroundPage.current.finishExecution()
//: [Next](@next)
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
