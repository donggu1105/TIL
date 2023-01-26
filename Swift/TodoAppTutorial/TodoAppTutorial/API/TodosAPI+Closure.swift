//
//  TodosAPI+Closure.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/25.
//

import UIKit
import MultipartForm

extension TodosAPI {
    
    
    // 모든 할일 목록 가져오기
    static func fetchTodos(page: Int = 1, completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos?" + "page=\(page)"
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            default:
                print("default")
            }
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
              let todosResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: jsonData)
              let todos = todosResponse.data

                // 상태코드는 200 인데 파싱한 데이터에 따른 오류 처리
                guard let todos = todos,
                      !todos.isEmpty else {return completion(.failure(ApiError.noContent))}
                
                
                
                
              completion(.success(todosResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
    
    // 특정 할일 목록 가져오기
    static func fetchATodo(id: Int, completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos/" + "\(id)"
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }

    // 할일 검색하기
    static func searchTodos(searchTerm: String, page: Int = 1, completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
//        let urlString = baseURL + "/search?" + "page=\(page)" + "&query=\(searchTerm)"
        
        let requestUrl = URL(baseUrl: baseURL + "/todos/search", queryItems: ["query" : searchTerm, "page": String(page)])
        
//        var urlComponents = URLComponents(string: baseURL + "/search")!
//        urlComponents.queryItems = [
//            URLQueryItem(name: "page", value: String(page)),
//            URLQueryItem(name: "type", value: "post"),
//            URLQueryItem(name: "query", value: searchTerm)
//        ]

        guard let url = requestUrl else {return completion(.failure(ApiError.notAllowedURL))}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
              let todosResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: jsonData)
              let todos = todosResponse.data

                // 상태코드는 200 인데 파싱한 데이터에 따른 오류 처리
                guard let todos = todos,
                      !todos.isEmpty else {return completion(.failure(ApiError.noContent))}
                
                
                
                
              completion(.success(todosResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }

    
    
    /// 할일 추가하기
    /// - Parameters: ->  option + commnad + /
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답결과
    static func addATodo(title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos"
        
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        let form = MultipartForm(parts: [
            MultipartForm.Part(name: "title", value: title),
            MultipartForm.Part(name: "is_done", value: "\(isDone)"),
//            MultipartForm.Part(name: "c", data: imageData, filename: "3.png", contentType: "image/png"),
        ])
        

        urlRequest.addValue(form.contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = form.bodyData
        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
    
    
    /// 할일 추가하기 - JSON
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답결과
    static func addATodoJson(title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos-json"
        
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let requestParams: [String: Any] = ["title": title, "is_done": "\(isDone)"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestParams, options: [.prettyPrinted])
            urlRequest.httpBody = jsonData

        } catch {
            return completion(.failure(ApiError.jsonEncodingError))
        }
        

        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }

    
    
    /// 할일 수정하기
    /// - Parameters:
    ///   - id: 할일 ID
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답결과
    static func editTodoJson(id: Int,
                         title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos-json/\(id)"
        
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let requestParams: [String: Any] = ["title": title, "is_done": "\(isDone)"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestParams, options: [.prettyPrinted])
            urlRequest.httpBody = jsonData

        } catch {
            return completion(.failure(ApiError.jsonEncodingError))
        }
        

        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
    
    
    
    /// 할일 수정하기 - PUT urlEncoded
    /// - Parameters:
    ///   - id: 할일 ID
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답결과
    static func editTodo(id: Int,
                         title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        

        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        
        let requestParams: [String: String] = ["title": title, "is_done": "\(isDone)"]
        
        
        urlRequest.percentEncodeParameters(parameters: requestParams)
 
        

        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
    
    
    /// 할일 삭제하기
    /// - Parameters:
    ///   - id: 할일 ID
    ///   - completion: 응답결과
    static func deleteTodo(id: Int,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) {
        
        print(#fileID, #function, #line, "- id : \(id)")
        // 1. urlReqeust 만들기
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {return completion(.failure(ApiError.notAllowedURL))}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        
        // 2. urlSession 으로 API를 호출한다.
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(error)")
            
            if let error = error {
                return completion(.failure(ApiError.unknown(error)))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            case 204:
                return completion(.failure(ApiError.noContent))
            default:
                print("default")
            }
            
            // 상태코드 에러처리
            if !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
 
            
            // 3. API 호출에대한 응답을 받는다.
            if let jsonData = data {

            do {
               // 데이터 파싱
                let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
//              let todos = baseResponse.data

              completion(.success(baseResponse))
            } catch {
              // decoding error : JSON -> 우리가 사용하는 데이터 모델 class,struct
                completion(.failure(ApiError.decodingError))
                }
            }
        }.resume()
    }
    
    
    /// 할일 추가 -> 모든 할일 가져오기
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - isDone: <#isDone description#>
    ///   - completion: <#completion description#>
    static func addATodoAndFetchTodos(title:String, isDone: Bool = false, completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) {
        self.addATodo(title: title) { result in
            switch result {
            case .success(_):
                self.fetchTodos(completion: {
                    switch $0 {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let failure):
                        completion(.failure(failure))
                    }
                
                })
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
    
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 todos
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func fetchSelectedTodos(selectedTodoIds: [Int], completion: @escaping (Result<[Todo], ApiError>) -> Void) {
        
        let group = DispatchGroup()
        
        // 가져온 할일들
        var fetchedTodos: [Todo] = [Todo]()
        // 에러들
        var apiErros: [ApiError] = []
        // 응답 결과들
        var apiResults = [Int : Result<BaseResponse<Todo>, ApiError>]()
        
        selectedTodoIds.forEach { id in
            group.enter()
            
            self.deleteTodo(id: id) { result in
                switch result {
                case .success(let response):
                    if let todo = response.data {
                        fetchedTodos.append(todo)
                    }
                    
                case .failure(let failure):
                    apiErros.append(failure)
                    print("inner deleteATodo - failure: \(failure)")
                }
                group.leave()
            }
            
        }
        
        group.notify(queue: .main) {
            print("모든 api 완료")
            // error 있을떄
            if !apiErros.isEmpty {
                if let firstError = apiErros.first {
                    completion(.failure(firstError))
                    return
                }
            }
            completion(.success(fetchedTodos))
        }
    }
}


