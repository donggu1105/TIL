//
//  TodosAPI+Closure.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/22.
//

import Foundation
import MultipartForm
import RxSwift
import Combine

extension TodosAPI {
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodos(page: Int = 1, completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
//        return completion(.failure(ApiError.notAllowedUrl))
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
                return completion(.failure(ApiError.unknown(error)))
            }
                 
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("bad status code")
                return completion(.failure(ApiError.unknown(nil)))
            }
            
            switch httpResponse.statusCode {
            case 401:
                return completion(.failure(ApiError.unauthorized))
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let listResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: jsonData)
                  let todos = listResponse.data
                    print("todosResponse: \(listResponse)")
                    
                    // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                    guard let todos = todos,
                          !todos.isEmpty else {
                        return completion(.failure(ApiError.noContent))
                    }
                    
                    completion(.success(listResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    
    /// 특정 할 일 가져오기
    static func fetchATodo(id: Int, completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "/\(id)"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    
    /// 할 일 검색하기
    static func searchTodos(searchTerm: String, page: Int = 1, completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
//        let urlString = baseURL + "/todos/search" + "?query=\(searchTerm)" + "&page=\(page)"
        
        
        let requestUrl = URL(baseUrl: baseURL + "/todos/search", queryItems: ["query" : searchTerm,
                                                                              "page" : "\(page)"])
        
//        var urlComponents = URLComponents(string: baseURL + "/todos/search")
//        urlComponents?.queryItems = [
//            URLQueryItem(name: "query", value: searchTerm),
//            URLQueryItem(name: "page", value: "\(page)")
//        ]
        
        guard let url = requestUrl else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let listResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: jsonData)
                  let todos = listResponse.data
                    print("todosResponse: \(listResponse)")
                    
                    // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                    guard let todos = todos,
                          !todos.isEmpty else {
                        return completion(.failure(ApiError.noContent))
                    }
                    
                    completion(.success(listResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    /// 할 일 추가하기
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodo(title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        let form = MultipartForm(parts: [
            MultipartForm.Part(name: "title", value: title),
            MultipartForm.Part(name: "is_done", value: "\(isDone)")
        ])
        
        print("form.contentType : \(form.contentType)")
        
        urlRequest.addValue(form.contentType, forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = form.bodyData
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    /// 할 일 추가하기 - Json
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoJson(title: String,
                         isDone: Bool = false,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : Any] = ["title": title, "is_done" : "\(isDone)"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestParams, options: [.prettyPrinted])
            
            urlRequest.httpBody = jsonData
            
        } catch {
            
            return completion(.failure(ApiError.jsonEncoding))
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    /// 할 일 수정하기 - Json
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoJson(id: Int,
                             title: String,
                             isDone: Bool = false,
                             completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json/\(id)"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : Any] = ["title": title, "is_done" : "\(isDone)"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestParams, options: [.prettyPrinted])
            
            urlRequest.httpBody = jsonData
            
        } catch {
            
            return completion(.failure(ApiError.jsonEncoding))
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    /// 할 일 수정하기 - PUT urlEncoded
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodo(id: Int,
                             title: String,
                             isDone: Bool = false,
                             completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : String] = ["title": title, "is_done" : "\(isDone)"]
        
        urlRequest.percentEncodeParameters(parameters: requestParams)
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    /// 할 일 삭제하기 - DELETE
    /// - Parameters:
    ///   - id: 삭제할 아이템 아이디
    ///   - completion: 응답결과
    static func deleteATodo(id: Int,
                         completion: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void){
        
        print(#fileID, #function, #line, "- deleteATodo 호출됨 / id: \(id)")
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return completion(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
            
            print("data: \(data)")
            print("urlResponse: \(urlResponse)")
            print("err: \(err)")
            
            
            if let error = err {
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
                
            default: print("default")
            }
            
            if !(200...299).contains(httpResponse.statusCode){
                return completion(.failure(ApiError.badStatus(code: httpResponse.statusCode)))
            }
            
            if let jsonData = data {
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: jsonData)
                    
                    completion(.success(baseResponse))
                } catch {
                  // decoding error
                    completion(.failure(ApiError.decodingError))
                }
              }
            
        }.resume()
    }
    
    
    /// 할일 추가 -> 모든 할일 가져오기
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodos(title: String,
                                      isDone: Bool = false,
                                      completion: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void){
        // 1
        self.addATodo(title: title, completion: { result in
            switch result {
                // 1-1
            case .success(_):
                // 2
                self.fetchTodos(completion: {
                    switch $0 {
                        // 2-1
                    case .success(let data):
                        completion(.success(data))
                        // 2-2
                    case .failure(let failure):
                        completion(.failure(failure))
                    }
                })
                // 1-2
            case .failure(let failure):
                completion(.failure(failure))
            }
        })
        
    }
    
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodos(selectedTodoIds: [Int],
                                    completion: @escaping ([Int]) -> Void){
        
        let group = DispatchGroup()
        
        // 성공적으로 삭제가 이뤄진 녀석들
        var deletedTodoIds : [Int] = [Int]()
        
        selectedTodoIds.forEach { aTodoId in
            
            // 디스패치 그룹에 넣음
            group.enter()
            
            self.deleteATodo(id: aTodoId,
                             completion: { result in
                switch result {
                case .success(let response):
                    // 삭제된 아이디를 삭제된 아이디 배열에 넣는다
                    if let todoId = response.data?.id {
                        deletedTodoIds.append(todoId)
                        print("inner deleteATodo - success: \(todoId)")
                    }
                case .failure(let failure):
                    print("inner deleteATodo - failure: \(failure)")
                }
                group.leave()
            })// 단일 삭제 API 호출
        }
        
        // Configure a completion callback
        group.notify(queue: .main) {
            // All requests completed
            print("모든 api 완료 됨")
            completion(deletedTodoIds)
        }
    }
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodos(selectedTodoIds: [Int],
                                    completion: @escaping (Result<[Todo], ApiError>) -> Void){
        
        let group = DispatchGroup()
        
        // 가져온 할일들
        var fetchedTodos : [Todo] = [Todo]()
        
        // 에러들
        var apiErrors : [ApiError] = []
        
        // 응답 결과들
        var apiResults = [Int : Result<BaseResponse<Todo>, ApiError>]()
        
        
        selectedTodoIds.forEach { aTodoId in
            
            // 디스패치 그룹에 넣음
            group.enter()
            
            self.fetchATodo(id: aTodoId,
                             completion: { result in
                switch result {
                case .success(let response):
                    // 가져온 할일을 가져온 할일 배열에 넣는다
                    if let todo = response.data {
                        fetchedTodos.append(todo)
                        print("inner fetchATodo - success: \(todo)")
                    }
                case .failure(let failure):
                    apiErrors.append(failure)
                    print("inner fetchATodo - failure: \(failure)")
                }
                group.leave()
            })// 단일 할일 조회 API 호출
        }
        
        // Configure a completion callback
        group.notify(queue: .main) {
            // All requests completed
            print("모든 api 완료 됨")
            
            // 만약 에러가 있다면 에러 올려주기
            if !apiErrors.isEmpty {
                if let firstError = apiErrors.first {
                    completion(.failure(firstError))
                    return
                }
            }
            
            completion(.success(fetchedTodos))
        }
    }
}


//MARK: - Closure to Async
extension TodosAPI {
    
    /// 에러 처리 X - result
    /// Closure -> Async
    static func fetchTodosClosureToAsync(page: Int = 1) async -> Result<BaseListResponse<Todo>, ApiError> {
        return await withCheckedContinuation { (continuation: CheckedContinuation<Result<BaseListResponse<Todo>, ApiError>, Never>) in
            
            fetchTodos(page: page, completion: { (result : Result<BaseListResponse<Todo>, ApiError>) in
                continuation.resume(returning: result)
            })
        }
    }
    
    /// 에러 처리 X - [Todo]
    /// Closure -> Async
    static func fetchTodosClosureToAsyncReturnArray(page: Int = 1) async -> [Todo] {
        return await withCheckedContinuation { (continuation: CheckedContinuation<[Todo], Never>) in
            
            fetchTodos(page: page, completion: { (result : Result<BaseListResponse<Todo>, ApiError>) in
                
                switch result {
                case .success(let success):
                    continuation.resume(returning: success.data ?? [])
                case .failure(let _):
                    continuation.resume(returning: [])
                }
            })
        }
    }
    
    
    /// 에러 처리 O
    /// Closure -> Async
    static func fetchTodosClosureToAsyncWithError(page: Int = 1) async throws -> BaseListResponse<Todo> {
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<BaseListResponse<Todo>, Error>) in
            
            fetchTodos(page: page, completion: { (result : Result<BaseListResponse<Todo>, ApiError>) in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            })
        })
    }
    
    /// 에러 처리 O - 에러 형태 변경
    /// Closure -> Async
    static func fetchTodosClosureToAsyncWithMapError(page: Int = 1) async throws -> BaseListResponse<Todo> {
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<BaseListResponse<Todo>, Error>) in
            
            fetchTodos(page: page, completion: { (result : Result<BaseListResponse<Todo>, ApiError>) in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let failure):
                    
                    if let decodingErr = failure as? DecodingError {
                        continuation.resume(throwing: ApiError.decodingError)
                        return
                    }
                    
                    continuation.resume(throwing: ApiError.unknown(failure))
                }
            })
        })
    }
    
    /// 에러 처리 O - 미션 풀이
    /// Closure -> Async
    static func fetchATodoClosureToAsync(id: Int) async throws -> BaseResponse<Todo> {
        return try await withCheckedThrowingContinuation({ (continuation : CheckedContinuation<BaseResponse<Todo>, Error>) in
            fetchATodo(id: id, completion: { result in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            })
        })
    }
    
    /// 에러 처리 X - 미션 풀이
    /// Closure -> Async
    static func fetchATodoClosureToAsyncNoError(id: Int) async -> BaseResponse<Todo>? {
        return await withCheckedContinuation({ (continuation : CheckedContinuation<BaseResponse<Todo>?, Never>) in
            fetchATodo(id: id, completion: { result in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let _):
                    continuation.resume(returning: nil)
                }
            })
        })
    }
    
    /// 에러 처리 O - 미션 풀이 - 에러 형태 변경
    /// Closure -> Async
    static func fetchATodoClosureToAsyncMapError(id: Int) async throws -> BaseResponse<Todo> {
        return try await withCheckedThrowingContinuation({ (continuation : CheckedContinuation<BaseResponse<Todo>, Error>) in
            fetchATodo(id: id, completion: { result in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let failure):
                    
                    if let decodingErr = failure as? DecodingError {
                        continuation.resume(throwing: ApiError.decodingError)
                        return
                    }
                    
                    continuation.resume(throwing: failure)
                }
            })
        })
    }
    
}

//MARK: - Closure to Rx Observable
extension TodosAPI {
    
    /// 에러 처리 X - result
    /// Closure -> Rx Observable
    static func fetchTodosClosureToObservable(page: Int = 1) -> Observable<Result<BaseListResponse<Todo>, ApiError>> {
        return Observable.create { (observer : AnyObserver<Result<BaseListResponse<Todo>, ApiError>>) in
            
            fetchTodos(page: page, completion: { result in
                observer.onNext(result)
                observer.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    /// 에러 처리 X - 배열 [] - 에러시 빈배열
    /// Closure -> Rx Observable
    static func fetchTodosClosureToObservableDataArray(page: Int = 1) -> Observable<[Todo]> {
        return Observable.create { (observer : AnyObserver<BaseListResponse<Todo>>) in
            // 1
            fetchTodos(page: page, completion: { result in
                switch result {
                case .success(let success): // 1-1
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure): // 1-2
                    observer.onError(failure)
                }
            })
            return Disposables.create()
        }
        .map{ $0.data ?? [] }
//        .catch { err in
//            return Observable.just([])
//        }
        .catchAndReturn([])
        
    }
    
    /// 에러 처리 O
    /// Closure -> Rx Observable
    static func fetchTodosClosureToObservableWithError(page: Int = 1) -> Observable<BaseListResponse<Todo>> {
        return Observable.create { (observer : AnyObserver<BaseListResponse<Todo>>) in
            
            // 1
            fetchTodos(page: page, completion: { result in
                
                switch result {
                case .success(let success): // 1-1
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure): // 1-2
                    observer.onError(failure)
                }
            })
            
            return Disposables.create()
        }
    }
    
    /// 에러 처리 O - 에러 형태 변경
    /// Closure -> Rx Observable
    static func fetchTodosClosureToObservableWithMapError(page: Int = 1) -> Observable<BaseListResponse<Todo>> {
        return Observable.create { (observer : AnyObserver<BaseListResponse<Todo>>) in
            // 1
            fetchTodos(page: page, completion: { result in
                switch result {
                case .success(let success): // 1-1
                    observer.onNext(success)
                    observer.onCompleted()
                case .failure(let failure): // 1-2
                    observer.onError(failure)
                }
            })
            return Disposables.create()
        }.catch { failure in
            
            if let apiErr = failure as? ApiError {
                throw ApiError.unauthorized
            }
            
            throw failure
        }
    }
    
    /// 에러 처리 X  - 미션 풀이
    /// Closure -> Rx Observable
    static func fetchATodoClosureToObservableNoError(id: Int) -> Observable<Todo> {
        return Observable.create { (observer: AnyObserver<BaseResponse<Todo>>) in
            fetchATodo(id: id, completion: { result in
                switch result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let failure):
                    observer.onError(failure)
                }
            })
            return Disposables.create()
        }.compactMap{ response in
            guard let todo = response.data else {
                throw ApiError.noContent
            }
            return response.data
        }
    }
    
    
}

//MARK: - Closure -> Publisher
extension TodosAPI {
    
    /// 에러 처리 O - 미션풀이
    /// Closure -> Publisher
    static func fetchATodoClosureToPublisher(id: Int) -> AnyPublisher<Todo?, Never> {
        
        return Future { (promise: @escaping (Result<BaseResponse<Todo>, ApiError>) -> Void) in
            fetchATodo(id: id, completion: { promise($0) })
        }
        .map{ $0.data }
        .replaceError(with: nil)
        .eraseToAnyPublisher()
    }
    
    /// 에러 처리 O
    /// Closure -> Publisher
    static func fetchTodosClosureToPublisher(page: Int = 1) -> AnyPublisher<BaseListResponse<Todo>, ApiError> {
        return Future { (promise: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) in
            fetchTodos(page: page, completion: { result in
                promise(result)
            })
        }.eraseToAnyPublisher()
    }
    
    /// 에러 처리 O - 에러 형태 변경
    /// Closure -> Publisher
    static func fetchTodosClosureToPublisherMapError(page: Int = 1) -> AnyPublisher<BaseListResponse<Todo>, ApiError> {
        return Future { (promise: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) in
            fetchTodos(page: page, completion: { result in
                promise(result)
            })
        }.mapError({ err in
            if let urlErr = err as? ApiError {
                return ApiError.unauthorized
            }
            return err
        })
        .eraseToAnyPublisher()
    }
    
    /// 에러 처리 X - []
    /// Closure -> Publisher
    static func fetchTodosClosureToPublisherNoError(page: Int = 1) -> AnyPublisher<[Todo], Never> {
        return Future { (promise: @escaping (Result<[Todo], Never>) -> Void) in
            fetchTodos(page: page, completion: { result in
                switch result {
                case .success(let data):
                    promise(.success(data.data ?? []))
                case .failure(let failure):
                    promise(.success([]))
                }
            })
        }.eraseToAnyPublisher()
    }
    
    
    /// 에러 처리 X - []
    /// Closure -> Publisher
    static func fetchTodosClosureToPublisherReturnArray(page: Int = 1) -> AnyPublisher<[Todo], Never> {
        return Future { (promise: @escaping (Result<BaseListResponse<Todo>, ApiError>) -> Void) in
            fetchTodos(page: page, completion: { result in
                promise(result)
            })
        }
        .map{ $0.data ?? [] }
        .catch({ err in
            return Just([])
        })
//        .replaceError(with: [])
        .eraseToAnyPublisher()
    }
    
}
