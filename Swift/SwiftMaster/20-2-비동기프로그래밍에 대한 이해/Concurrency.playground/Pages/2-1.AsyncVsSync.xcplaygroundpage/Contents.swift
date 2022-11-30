//: [Previous](@previous)
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


// 동기적인 함수의 정의

func task1() {
    print("Task 1 시작")
    sleep(2)
    print("Task 1 완료★")
}

func task2() {
    print("Task 2 시작")
    sleep(2)
    print("Task 2 완료★")
}

func task3() {
    print("Task 3 시작")
    sleep(2)
    print("Task 3 완료★")
}


// 비동기적인 함수의 정의

func task4() {
    DispatchQueue.global().async {
        print("Task 4 시작")
        sleep(2)
        print("Task 4 완료★")
    }
}

func task5() {
    DispatchQueue.global().async {
        print("Task 5 시작")
        sleep(2)
        print("Task 5 완료★")
    }
}

func task6() {
    DispatchQueue.global().async {
        print("Task 6 시작")
        sleep(2)
        print("Task 6 완료★")
    }
}



//: # 코드레벨에서의 동기(sync) VS 비동기(async)

//: ### 동기적인 작업의 진행

task1()   // 일이 끝나야 다음줄로 이동 (내부 동기)
task2()   // 일이 끝나야 다음줄로 이동 (내부 동기)
task3()   // 일이 끝나야 다음줄로 이동 (내부 동기)


//: ### 비동기적인 작업의 진행
// 내부적으로 비동기처리가 되어있는 함수들


task4()   // 일이 끝나지 않아도 다음줄로 이동 (내부 비동기)
task5()   // 일이 끝나지 않아도 다음줄로 이동 (내부 비동기)
task6()   // 일이 끝나지 않아도 다음줄로 이동 (내부 비동기)










sleep(4)
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
