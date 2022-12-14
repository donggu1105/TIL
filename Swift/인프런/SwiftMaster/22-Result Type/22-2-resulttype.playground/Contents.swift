import UIKit

/*:
 ## 네트워킹 코드에서 Result타입
 * 네트워킹 코드에서의 활용
 ---
 */

enum NetworkError: Error {
    case someError
}


//:> Result 타입 사용하기 전
// 튜플타입을 활용, 데이터 전달

func performRequest(with url: String, completion: @escaping (Data?, NetworkError?) -> Void) {
    
    guard let url = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print(error!)                 // 에러가 발생했음을 출력
            completion(nil, .someError)   // 에러가 발생했으니, nil 전달
            return
        }
        
        guard let safeData = data else {
            completion(nil, .someError)   // 안전하게 옵셔널 바인딩을 하지 못했으니, 데이터는 nil 전달
            return
        }
    
        completion(safeData, nil)
        
    }.resume()
}



performRequest(with: "주소") { data, error in
    // 데이터를 받아서 처리
    if error != nil {
        print(error!)
    }
    
    // 데이터 처리 관련 코드
    
}



//:> Result 타입 사용 후

func performRequest2(with urlString: String, completion: @escaping (Result<Data,NetworkError>) -> Void) {
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print(error!)                     // 에러가 발생했음을 출력
            completion(.failure(.someError))  // 실패 케이스 전달
            return
        }
        
        guard let safeData = data else {
            completion(.failure(.someError))   // 실패 케이스 전달
            return
        }
    
        completion(.success(safeData))      // 성공 케이스 전달
       
        
    }.resume()
}




performRequest2(with: "주소") { result in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let data):
        // 데이터 처리 관련 코드
        break
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
