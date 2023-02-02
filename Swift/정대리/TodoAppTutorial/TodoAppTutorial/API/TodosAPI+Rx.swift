//
//  TodosAPI+Rx.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/23.
//

import Foundation
import MultipartForm
import RxSwift
import RxCocoa

extension TodosAPI {
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithObservableResult(page: Int = 1) -> Observable<Result<BaseListResponse<Todo>, ApiError>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        guard let url = URL(string: urlString) else {
            return Observable.just(.failure(ApiError.notAllowedUrl))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx
            .response(request: urlRequest)
            .map({ (urlResponse: HTTPURLResponse, data: Data) -> Result<BaseListResponse<Todo>, ApiError> in
                
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
    }
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithObservable(page: Int = 1) -> Observable<BaseListResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx
            .response(request: urlRequest)
            .map({ (urlResponse: HTTPURLResponse, data: Data) -> Data in
                
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
            .decode(type: BaseListResponse<Todo>.self, decoder: JSONDecoder())
            .map { response in
                guard let todos = response.data, !todos.isEmpty else {
                    throw ApiError.noContent
                }
                return response
            }
            .catch {err in
                if let error = err as? ApiError {
                    throw error
                }
                if let decodingErr = err as? DecodingError {
                    throw ApiError.decodingError
                }
                throw ApiError.unknown(err)
                
            }
    }
    
    /// 특정 할 일 가져오기
    static func fetchATodoWithObservable(id: Int) -> Observable<BaseResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map({ (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
                
            })
    }
    
    /// 할 일 검색하기
    static func searchTodosWithObservable(searchTerm: String, page: Int = 1) -> Observable<BaseListResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        let requestUrl = URL(baseUrl: baseURL + "/todos/search", queryItems: ["query" : searchTerm,
                                                                              "page" : "\(page)"])
        guard let url = requestUrl else {
            return Observable.error(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseListResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let listResponse = try JSONDecoder().decode(BaseListResponse<Todo>.self, from: data)
                  let todos = listResponse.data
                    print("todosResponse: \(listResponse)")
                    
                    // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
                    guard let todos = todos,
                          !todos.isEmpty else {
                        throw ApiError.noContent
                    }
                    
                    return listResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    /// 할 일 추가하기
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoWithObservable(title: String,
                         isDone: Bool = false) -> Observable<BaseResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
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
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    /// 할 일 추가하기 - Json
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoJsonWithObservable(title: String,
                         isDone: Bool = false) -> Observable<BaseResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
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
            return Observable.error(ApiError.jsonEncoding)
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    /// 할 일 수정하기 - Json
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoJsonWithObservable(id: Int,
                             title: String,
                             isDone: Bool = false) -> Observable<BaseResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
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
            return Observable.error(ApiError.jsonEncoding)
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    /// 할 일 수정하기 - PUT urlEncoded
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoWithObservable(id: Int,
                             title: String,
                             isDone: Bool = false) -> Observable<BaseResponse<Todo>>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : String] = ["title": title, "is_done" : "\(isDone)"]
        
        urlRequest.percentEncodeParameters(parameters: requestParams)
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    /// 할 일 삭제하기 - DELETE
    /// - Parameters:
    ///   - id: 삭제할 아이템 아이디
    ///   - completion: 응답결과
    static func deleteATodoWithObservable(id: Int) -> Observable<BaseResponse<Todo>>{
        
        print(#fileID, #function, #line, "- deleteATodo 호출됨 / id: \(id)")
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            return Observable.error(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        return URLSession.shared.rx.response(request: urlRequest)
            .map { (urlResponse: HTTPURLResponse, data: Data) -> BaseResponse<Todo> in
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
                
                // convert data to our swift model
                do {
                    // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
                  let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
                    
                    return baseResponse
                } catch {
                  // decoding error
                    throw ApiError.decodingError
                }
            }
    }
    
    
    /// 할일 추가 -> 모든 할일 가져오기
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithObservable(title: String,
                                      isDone: Bool = false) -> Observable<[Todo]>{
        
        return self.addATodoWithObservable(title: title)
            .flatMapLatest { _ in
                self.fetchTodosWithObservable()
            }
            .compactMap {$0.data}
            .catch({err in
                print("TodosAPI - catch : err : \(err)")
                return Observable.just([])
            })
            .share(replay: 1)
        
//        // 1
//        return self.addATodoWithObservable(title: title)
//                    .flatMapLatest { _ in
//                        self.fetchTodosWithObservable()
//                    } // BaseListResponse<Todo>
//                    .compactMap{ $0.data } // [Todo]
//                    .catch({ err in
//                        print("TodosAPI - catch : err : \(err)")
//                        return Observable.just([])
//                    })
//                    .share(replay: 1)
    }
    
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithObservable(selectedTodoIds: [Int]) -> Observable<[Int]>{
        // 1. 매개변수 배열 -> Observable 스트림 배열로
        
        // 2. 배열로 단일 api들 호출
        let apiCallObservables = selectedTodoIds.map { id -> Observable<Int?> in
            return self.deleteATodoWithObservable(id: id)
                .map{$0.data?.id} // Int?
                .catchAndReturn(nil)
//                .catch {err in
//                    return Observable.just(nil)
//                }
        }
        
        return Observable.zip(apiCallObservables)
            .map{ // Observable<[Int?]>
                $0.compactMap{$0} // Observables<[Int]>
            }
    }
    
    
    static func deleteSelectedTodosWithObservableMerge(selectedTodoIds: [Int]) -> Observable<Int>{
        // 1. 매개변수 배열 -> Observable 스트림 배열로
        
        // 2. 배열로 단일 api들 호출
        let apiCallObservables = selectedTodoIds.map { id -> Observable<Int?> in
            return self.deleteATodoWithObservable(id: id)
                .map{$0.data?.id} // Int?
                .catchAndReturn(nil)
        }
            
        return Observable.merge(apiCallObservables).compactMap{$0}
    }


    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodosWithObservable(selectedTodoIds: [Int],
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


extension ObservableType {
    // 횟수, 딜레이
    func retryWithDelayAndCondition(retryCount: Int = 1,
                                    delay: Int = 1,
                                    when: ((Error) -> Bool)? = nil // 던질 에러인지 아닌지 판단하는 클로저
    ) -> Observable<Element> {
        
            return self.retry(when: {(observableErr : Observable<TodosAPI.ApiError>) in
                observableErr
                    .do(onNext: { err in
                        print("observableErr - err : \(err)")
                    })
                    .flatMap { err in
                            
                        if !(when?(err) ?? true) {
                            throw err
                        }
                        // 에러 ->  boolean 여부 판단
                        return Observable<Void>.just(()).delay(.seconds(3), scheduler: MainScheduler.instance)
                    }
                    .take(retryCount)
            })
    }
    
    
    func retryWithDelayAndConditionCatch(retryCount: Int = 1,
                                    delay: Int = 1,
                                    when: ((Error) -> Bool)? = nil // 던질 에러인지 아닌지 판단하는 클로저
    ) -> Observable<Element> {
        
        return self.catch( err -> Ob)
    }
    
    
}
