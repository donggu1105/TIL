import Foundation
import PlaygroundSupport
// 플레이 그라운드 작업 중간에 멈추지 않게 하기 위함
// (비동기작업으로 인해, 플레이그라운드의 모든 작업이 끝난다고 인식할 수 있기때문에 사용)
PlaygroundPage.current.needsIndefiniteExecution = true



//: # 빨리 끝나는 작업들
//: ### 다른 쓰레드를 사용해야할지에 대해 인지하지 못했던 간단했던 작업들
// 간단한 프린트 작업 예시 (컴퓨터, 아이폰은 이정도 작업들은 금방 처리 가능)

func task1() {
    print("Task 1 시작")
    print("Task 1 완료★")
}

func task2() {
    print("Task 2 시작")
    print("Task 2 완료★")
}

func task3() {
    print("Task 3 시작")
    print("Task 3 완료★")
}

func task4() {
    print("Task 4 시작")
    print("Task 4 완료★")
}

func task5() {
    print("Task 5 시작")
    print("Task 5 완료★")
}


task1()
task2()
task3()
task4()
task5()




//: # 오래 걸리는 작업들
//: ### 이제 네트워킹과 같이 오래걸리는 작업이 있다면
// 함수가 임의적으로 오래걸리도록 정의


func task6() {
    print("Task 6 시작")
    sleep(2)
    print("Task 6 완료★")
}

func task7() {
    print("Task 7 시작")
    sleep(2)
    print("Task 7 완료★")
}

func task8() {
    print("Task 8 시작")
    sleep(2)
    print("Task 8 완료★")
}

func task9() {
    print("Task 9 시작")
    sleep(2)
    print("Task 9 완료★")
}

func task10() {
    print("Task 10 시작")
    sleep(2)
    print("Task 10 완료★")
}



// 비동기처리를 하지 않으면 10초이상이 걸림

task6()
task7()
task8()
task9()
task10()




//: ### 오래 걸리는 작업을 비동기 처리를 한다면

DispatchQueue.global().async {
    task6()
}

DispatchQueue.global().async {
    task7()
}

DispatchQueue.global().async {
    task8()
}

DispatchQueue.global().async {
    task9()
}

DispatchQueue.global().async {
    task10()
}






sleep(4)
// 작업이 종료되었으니 플레이그라운드 실행 종료 Ok.
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
