import UIKit


/*:
 ## 중첩 타입(Nested Types)의 사용예시
* 실제 앱에서 swift파일을 따로 만들어 실수하기 쉬운 "문자열" 모음을 아래처럼도 사용 가능
---
*/

struct K {
    static let appName = "MySuperApp"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}



// 문자열 대신에 아래처럼 사용할 수 있음 ⭐️ (문자열 실수는 치명적인 에러를 발생시킴)

let app = K.appName      // "MySuperApp"
let color = K.BrandColors.blue    // "BrandLightBlue"





/*:
---
* 메세지 모델의 설계 (참고)
---
*/
// 어떤 메신저에서 메세지를 모델로 설계한다면
// 가정 1) 보낸 사람, 2) 받는 사람 3) 메세지 보낸 시간 4)

class Message {
    // 상태를 중첩타입으로 (외부에서 접근못하게 하려면, private으로 선언가능)
    private enum Status {
        case sent
        case received
        case read
    }
    
    // 보낸 사람, 받는 사람
    let sender: String, recipient: String, content: String
    
    // 보낸 시간
    let timeStamp: Date
    
    // 메세지 상태 정보 (보냄/받음/읽음)
    private var status: Message.Status = Message.Status.sent
    
    init(sender: String, recipient: String, content: String) {
        self.sender = sender
        self.recipient = recipient
        self.content = content
        
        self.timeStamp = Date()   // 현재시간 생성 ===> 시간은 유저가 주는 정보 아님
    }
    
    func getBasicInfo() -> String {
        return "보낸사람: \(sender), 받는사람: \(recipient), 메세지 내용: \(content), 보낸 시간: \(timeStamp.description), "
    }
    
    // 메세지 상태에 따라서, 색깔 바뀜
    func statusColor() -> UIColor {
        switch status {
        case .sent:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .received:
            return UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        case .read:
            return UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        }
    }
}


let message1 = Message(sender: "홍길동", recipient: "임꺽정", content: "뭐해?")
print(message1.getBasicInfo())

sleep(1)

let message2 = Message(sender: "임꺽정", recipient: "홍길동", content: "그냥있어")
print(message2.getBasicInfo())





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
