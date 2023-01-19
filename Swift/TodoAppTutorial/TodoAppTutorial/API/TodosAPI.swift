//
//  TodosAPI.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/18.
//

import Foundation

enum TodosAPI {

    static let version = "v1"
    #if DEBUG // 디버그
    static let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/" + version
    #else // 릴리즈
    static let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/" + version
    #endif
    
    
    enum ApiError: Error {
        case parsingError
        case noContent
        case decodingError
        case badStatus(code: Int)
        
    }
    
    
    static func fetchTodos(page: Int = 1, completion: @escaping (Result<TodosResponse, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos?" + "page=\(page)"
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            
            // 3. API 호출에대한 응답을 받는다.
            
            do {
                if let jsonData = data {
               // 데이터 파싱
              let todosResponse = try JSONDecoder().decode(TodosResponse.self, from: jsonData)
              let modelObjects = todosResponse.data
              completion(.success(todosResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
}
