//: [Previous](@previous)
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//: # UI업데이트는 메인쓰레드에서
//: ### 유저인터페이스(즉, 화면)와 관련된 작업은 메인쓰레드에서 진행해야 함

var imageView: UIImageView? = nil


let url = URL(string: "https://bit.ly/32ps0DI")!


// URL세션은 내부적으로 비동기로 처리된 함수임.
URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if error != nil{
        print("에러있음")
    }
    
    guard let imageData = data else { return }
    
    // 즉, 데이터를 가지고 이미지로 변형하는 코드
    let photoImage = UIImage(data: imageData)
    
    // 🎾 이미지 표시는 DispatchQueue.main에서 🎾
    DispatchQueue.main.async {
        imageView?.image = photoImage
    }
    
    
}.resume()





//:> UI와 관련된 일은 다시 메인쓰레드로 보내야 함

DispatchQueue.global().async {
    
    // 비동기적인 작업들 ===> 네트워크 통신 (데이터 다운로드)
    
    DispatchQueue.main.async {
        // UI와 관련된 작업은 
    }
}










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
