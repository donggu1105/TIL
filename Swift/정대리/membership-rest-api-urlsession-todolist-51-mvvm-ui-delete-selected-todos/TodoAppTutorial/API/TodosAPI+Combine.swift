//
//  TodosAPI+Combine.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/26.
//

import Foundation
import MultipartForm
import RxSwift
import RxCocoa
import Combine
import CombineExt

extension TodosAPI {
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithPublisherResult(page: Int = 1) -> AnyPublisher<Result<BaseListResponse<Todo>, ApiError>, Never>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        guard let url = URL(string: urlString) else {
            return Just(.failure(ApiError.notAllowedUrl)).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ (data: Data, urlResponse: URLResponse) -> Result<BaseListResponse<Todo>, ApiError> in
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    return .failure(ApiError.unknown(nil))
                }
                
                switch httpResponse.statusCode {
                case 401:
                    return .failure(ApiError.unauthorized)
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    return .failure(ApiError.badStatus(code: httpResponse.statusCode))
                }
                
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let listResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: data)
                  let todos = listResponse.data
                    print("todosResponse: \(listResponse)")
                    
                    // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                    guard let todos = todos,
                          !todos.isEmpty else {
                        return .failure(ApiError.noContent)
                    }
                    
                    return .success(listResponse)
                } catch {
                  // decoding error
                    return .failure(ApiError.decodingError)
                }
            })
//            .catch({ err in
//                return Just(.failure(ApiError.unknown(nil)))
//            })
            .replaceError(with: .failure(ApiError.unknown(nil))) // (에러 -> 데이터로 변경)
//            .assertNoFailure() // 에러가 나지 않을 것이다 라고 설정 (위험)
            .eraseToAnyPublisher()
    }
    
    // 구독 X
    // 데이터 스트림 즉 물줄기만 변경
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithPublisher(page: Int = 1) -> AnyPublisher<BaseListResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseListResponse<Todo>.self, decoder: JSONDecoder()) // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let todos = response.data,
                      !todos.isEmpty else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            })
            .print("Combine fetchTodos")
            .eraseToAnyPublisher()
    }
    
    
    
    
    /// 특정 할 일 가져오기
    static func fetchATodoWithPublisher(id: Int) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder())
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()

    }
    
    /// 할 일 검색하기
    static func searchTodosWithPublisher(searchTerm: String, page: Int = 1) -> AnyPublisher<BaseListResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        let requestUrl = URL(baseUrl: baseURL + "/todos/search", queryItems: ["query" : searchTerm,
                                                                              "page" : "\(page)"])
        guard let url = requestUrl else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseListResponse<Todo>.self, decoder: JSONDecoder()) // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let todos = response.data,
                      !todos.isEmpty else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            })
            .eraseToAnyPublisher()
    }
    
    /// 할 일 추가하기
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoWithPublisher(title: String,
                         isDone: Bool = false) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
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
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            }) // Data
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder()) // Decode
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()
    }
    
    /// 할 일 추가하기 - Json
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoJsonWithPublisher(title: String,
                         isDone: Bool = false) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
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
            return Fail(error: ApiError.jsonEncoding).eraseToAnyPublisher()
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder())
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()
    }
    
    /// 할 일 수정하기 - Json
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoJsonWithPublisher(id: Int,
                             title: String,
                             isDone: Bool = false) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
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
            return  Fail(error: ApiError.jsonEncoding).eraseToAnyPublisher()
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder())
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()
    }
    
    /// 할 일 수정하기 - PUT urlEncoded
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoWithPublisher(id: Int,
                             title: String,
                             isDone: Bool = false) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : String] = ["title": title, "is_done" : "\(isDone)"]
        
        urlRequest.percentEncodeParameters(parameters: requestParams)
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder())
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()
    }
    
    /// 할 일 삭제하기 - DELETE
    /// - Parameters:
    ///   - id: 삭제할 아이템 아이디
    ///   - completion: 응답결과
    static func deleteATodoWithPublisher(id: Int) -> AnyPublisher<BaseResponse<Todo>, ApiError>{
        
        print(#fileID, #function, #line, "- deleteATodo 호출됨 / id: \(id)")
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.notAllowedUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, urlResponse: URLResponse) -> Data in
                
                print("data: \(data)")
                print("urlResponse: \(urlResponse)")
                     
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("bad status code")
                    throw ApiError.unknown(nil)
                }
                
                switch httpResponse.statusCode {
                case 401:
                    throw ApiError.unauthorized
                case 204:
                    throw ApiError.noContent
                    
                default: print("default")
                }
                
                if !(200...299).contains(httpResponse.statusCode){
                    throw ApiError.badStatus(code: httpResponse.statusCode)
                }
                
                return data
            })
            .decode(type: BaseResponse<Todo>.self, decoder: JSONDecoder())
            .tryMap({ response in // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                guard let _ = response.data else {
                    throw ApiError.noContent
                }
                return response
            })
            .mapError({ err -> ApiError in
                if let error = err as? ApiError { // ApiError 라면
                    return error
                }
                
                if let _ = err as? DecodingError { // 디코딩 에러라면
                    return ApiError.decodingError
                }
                
                return ApiError.unknown(nil)
            }).eraseToAnyPublisher()
    }
    
    
    /// 할일 추가 -> 모든 할일 가져오기 - 에러함께
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithPublisher(title: String,
                                      isDone: Bool = false) -> AnyPublisher<[Todo], ApiError>{
        
        // 1
        return self.addATodoWithPublisher(title: title)
                    .flatMap { _ in
                        self.fetchTodosWithPublisher()
                    } // BaseListResponse<Todo>
                    .compactMap{ $0.data } // [Todo]
                    .eraseToAnyPublisher()
    }
    
    /// 할일 추가 -> 모든 할일 가져오기 - NO 에러
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithPublisherNoError(title: String,
                                      isDone: Bool = false) -> AnyPublisher<[Todo], Never>{
        
        // 1
        return self.addATodoWithPublisher(title: title)
                    .flatMap { _ in
                        self.fetchTodosWithPublisher()
                    } // BaseListResponse<Todo>
                    .compactMap{ $0.data } // [Todo]
//                    .catch({ err in
//                        print("TodosAPI - catch : err : \(err)")
//                        return Just([]).eraseToAnyPublisher()
//                    })
                    .replaceError(with: [])
                    .eraseToAnyPublisher()
    }
    
    /// 할일 추가 -> 모든 할일 가져오기 - NO 에러 switchToLatest
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithPublisherNoErrorSwitchToLatest(title: String,
                                      isDone: Bool = false) -> AnyPublisher<[Todo], Never>{
        
        // 1
        return self.addATodoWithPublisher(title: title)
                    .map { _ in
                        self.fetchTodosWithPublisher()
                    } // BaseListResponse<Todo>
                    .switchToLatest()
                    .compactMap{ $0.data } // [Todo]
//                    .catch({ err in
//                        print("TodosAPI - catch : err : \(err)")
//                        return Just([]).eraseToAnyPublisher()
//                    })
                    .replaceError(with: [])
                    .eraseToAnyPublisher()
    }
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithPublisher(selectedTodoIds: [Int]) -> Observable<[Int]>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallObservables = selectedTodoIds.map { id -> Observable<Int?> in
            return self.deleteATodoWithObservable(id: id)
                .map{ $0.data?.id } // Int?
                .catchAndReturn(nil)
//                .catch { err in
//                    return Observable.just(nil)
//                }
        }
        
        return Observable.zip(apiCallObservables)
                    .map{ // Observable<[Int?]>
                        $0.compactMap{ $0 } // Int
                    } // Observable<[Int]>
    }
    
    static func deleteSelectedTodosWithPublisherMergeWithError(selectedTodoIds: [Int]) -> AnyPublisher<Int, ApiError>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallPublishers : [AnyPublisher<Int?, ApiError>]
        = selectedTodoIds.map { id -> AnyPublisher<Int?, ApiError> in
            return self.deleteATodoWithPublisher(id: id)
                .map{ $0.data?.id } // Int?
                .eraseToAnyPublisher()
        }
        
        return Publishers.MergeMany(apiCallPublishers).compactMap{ $0 }.eraseToAnyPublisher()
    }
    
    static func deleteSelectedTodosWithPublisherMerge(selectedTodoIds: [Int]) -> AnyPublisher<Int, Never>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallPublishers : [AnyPublisher<Int?, Never>]
        = selectedTodoIds.map { id -> AnyPublisher<Int?, Never> in
            return self.deleteATodoWithPublisher(id: id)
                .map{ $0.data?.id } // Int?
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
        
        return Publishers.MergeMany(apiCallPublishers).compactMap{ $0 }.eraseToAnyPublisher()
    }
    
    static func deleteSelectedTodosWithPublisherZip(selectedTodoIds: [Int]) -> AnyPublisher<[Int], Never>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallPublishers : [AnyPublisher<Int?, Never>]
        = selectedTodoIds.map { id -> AnyPublisher<Int?, Never> in
            return self.deleteATodoWithPublisher(id: id)
                .map{ $0.data?.id } // Int?
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
        
        return apiCallPublishers.zip().map{ $0.compactMap{ $0 } }.eraseToAnyPublisher()
    }
    
    /// Rx 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodosPublisher(selectedTodoIds: [Int]) -> AnyPublisher<[Todo], Never>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallPublishers = selectedTodoIds.map { id -> AnyPublisher<Todo?, Never> in
            return self.fetchATodoWithPublisher(id: id)
                .map{ $0.data } // Todo?
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
        
        return apiCallPublishers.zip().map{ $0.compactMap{ $0 } }.eraseToAnyPublisher()
    }
    
    /// Rx 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodosPublisherMerge(selectedTodoIds: [Int]) -> AnyPublisher<Todo, Never>{
        
        //1. 매개변수 배열 -> Observable 스트림 배열
        
        //2. 배열로 단일 api들 호출
        let apiCallPublishers = selectedTodoIds.map { id -> AnyPublisher<Todo?, Never> in
            return self.fetchATodoWithPublisher(id: id)
                .map{ $0.data } // Todo?
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
        
        return Publishers.MergeMany(apiCallPublishers).compactMap{ $0 }.eraseToAnyPublisher()
    }
}

extension TodosAPI {
    // 구독 O
    // 받은 이벤트 기반으로 async 로 보냄
    /// combine -> async
    static func fetchTodosWithPublisherToAsync(page: Int = 1) async throws -> BaseListResponse<Todo> {
        
        return try await withCheckedThrowingContinuation({ (continuation : CheckedContinuation<BaseListResponse<Todo>, Error>) in
            
            var cancellable : AnyCancellable? = nil
            
            //1. 기존 publisher 이벤트를 구독
            cancellable = fetchTodosWithPublisher(page: page)
                // 2. 들어온 이벤트의 결과에 따라 async 이벤트 처리
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("finished")
                    case .failure(let failure):
                        print("failure : \(failure)")
                        continuation.resume(throwing: failure)
                    }
                    cancellable?.cancel()
                }, receiveValue: { response in
                    print("receiveValue : \(response)")
                    continuation.resume(returning: response)
                })
        })
        
    }
}


extension AnyPublisher {
    
    func toAsync() async throws -> Output {
        
        return try await withCheckedThrowingContinuation({ (continuation : CheckedContinuation<Output, Error>) in
            
            var cancellable : AnyCancellable? = nil
            
            //1. 기존 publisher 이벤트를 구독
            cancellable = first()
                // 2. 들어온 이벤트의 결과에 따라 async 이벤트 처리
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let failure):
                        continuation.resume(throwing: failure)
                    }
                    cancellable?.cancel()
                }, receiveValue: { response in
                    continuation.resume(returning: response)
                })
        })
    }
}

//MARK: - Combine Retry
extension Publisher {
    
    
    func retryWithDelayAndCondition<T, E>(retryCount: Int = 1,
                                    delay: Int = 1,
                                    when: ((Error) -> Bool)? = nil
    ) -> Publishers.TryCatch<Self, AnyPublisher<T, E>> where T == Self.Output, E == Self.Failure {
        return self.tryCatch({ err -> AnyPublisher<T, E> in
                
            // 조건
            guard (when?(err) ?? true) else {
                throw err
            }
                
            return Just(Void())
                .delay(for: .seconds(delay), scheduler: DispatchQueue.main) // 딜레이
                .flatMap { _ in
                    return self
                }
                .retry(retryCount - 1)
                .eraseToAnyPublisher()
            })
    }
    
}
