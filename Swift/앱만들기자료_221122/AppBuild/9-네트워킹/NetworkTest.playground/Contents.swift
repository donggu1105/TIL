import UIKit

// 실제 API에서 받게 되는 정보

struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// 실제 우리가 사용하게될 음악(Music) 모델 구조체
// (서버에서 가져온 데이터만 표시해주면 되기 때문에 일반적으로 구조체로 만듦)

struct Music: Codable {
    let songName: String?
    let artistName: String?
    let albumName: String?
    let previewUrl: String?
    let imageUrl: String?
    private let releaseDate: String?
    
    // 네트워크에서 주는 이름을 변환하는 방법 (원시값)
    // (서버: trackName ===> songName)
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
    
}


func getMethod(completion: @escaping ([Music]?) -> Void) {

    // URL구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=jazz") else {
        print("Error: cannot create URL")
        completion(nil)
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    
    // 요청을 가지고 작업세션시작
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            completion(nil)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            completion(nil)
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            completion(nil)
            return
        }
        do {
            let decoder = JSONDecoder()
            let musicData = try decoder.decode(MusicData.self, from: safeData)
            completion(musicData.results)
            return
        } catch {
            
        }
    }.resume()     // 시작


}



getMethod { musicArray in
    guard let array = musicArray else { return }
    dump(array)
}




