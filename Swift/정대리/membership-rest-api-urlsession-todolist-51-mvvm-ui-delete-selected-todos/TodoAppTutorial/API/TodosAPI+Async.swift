//
//  TodosAPI+Async.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/28.
//

import Foundation
import MultipartForm
import RxSwift
import RxCocoa
import Combine
import CombineExt

extension TodosAPI {
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithAsyncResult(page: Int = 1) async -> Result<BaseListResponse<Todo>, ApiError>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        guard let url = URL(string: urlString) else {
            return .failure(ApiError.notAllowedUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        
        do {
            
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            if let _ = error as? DecodingError {
                return .failure(ApiError.decodingError)
            }
            
            return .failure(ApiError.unknown(error))
        }
    }
    
    
    
    /// 모든 할 일 목록 가져오기
    static func fetchTodosWithAsync(page: Int = 1) async throws -> BaseListResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "?page=\(page)"
        
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            if let myApiErr = error as? ApiError {
                throw myApiErr
            }
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
            
    }
    
    /// 특정 할 일 가져오기
    static func fetchATodoWithAsync(id: Int) async throws -> BaseResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos" + "/\(id)"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
        
    }
    
    /// 할 일 검색하기
    static func searchTodosWithAsync(searchTerm: String, page: Int = 1) async throws -> BaseListResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        let requestUrl = URL(baseUrl: baseURL + "/todos/search", queryItems: ["query" : searchTerm,
                                                                              "page" : "\(page)"])
        guard let url = requestUrl else {
            throw ApiError.notAllowedUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    /// 할 일 추가하기
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoWithAsync(title: String,
                         isDone: Bool = false) async throws -> BaseResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
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
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    /// 할 일 추가하기 - Json
    /// - Parameters:
    ///   - title: 할일 타이틀
    ///   - isDone: 할일 완료여부
    ///   - completion: 응답 결과
    static func addATodoJsonWithAsync(title: String,
                         isDone: Bool = false) async throws -> BaseResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
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
            throw ApiError.jsonEncoding
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    /// 할 일 수정하기 - Json
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoJsonWithAsync(id: Int,
                             title: String,
                             isDone: Bool = false) async throws -> BaseResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos-json/\(id)"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
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
            throw ApiError.jsonEncoding
        }
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    /// 할 일 수정하기 - PUT urlEncoded
    /// - Parameters:
    ///   - id: 수정할 아이템 아이디
    ///   - title: 타이틀
    ///   - isDone: 완료여부
    ///   - completion: 응답결과
    static func editTodoWithAsync(id: Int,
                             title: String,
                             isDone: Bool = false) async throws -> BaseResponse<Todo>{
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let requestParams : [String : String] = ["title": title, "is_done" : "\(isDone)"]
        
        urlRequest.percentEncodeParameters(parameters: requestParams)
        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    /// 할 일 삭제하기 - DELETE
    /// - Parameters:
    ///   - id: 삭제할 아이템 아이디
    ///   - completion: 응답결과
    static func deleteATodoWithAsync(id: Int) async throws -> BaseResponse<Todo>{
        
        print(#fileID, #function, #line, "- deleteATodo 호출됨 / id: \(id)")
        
        // 1. urlRequest 를 만든다
        
        let urlString = baseURL + "/todos/\(id)"
        
        guard let url = URL(string: urlString) else {
            throw ApiError.notAllowedUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")

        
        // 2. urlSession 으로 API를 호출한다
        // 3. API 호출에 대한 응답을 받는다
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
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
            
            // JSON -> Struct 로 변경 즉 디코딩 즉 데이터 파싱
            let baseResponse = try JSONDecoder().decode(BaseResponse<Todo>.self, from: data)
            let aTodo = baseResponse.data
            print("baseResponse: \(baseResponse)")
            
            // 상태 코드는 200인데 파싱한 데이터에 따라서 에러처리
            guard let _ = aTodo else {
                throw ApiError.noContent
            }
            
            return baseResponse
            
        } catch {
            
            if let myError = error as? ApiError {
                throw myError
            }
            
            if let apiError = error as? URLError {
                throw ApiError.badStatus(code: apiError.errorCode)
            }
            
            if let _ = error as? DecodingError {
                throw ApiError.decodingError
            }
            
            throw ApiError.unknown(error)
        }
    }
    
    
    /// 할일 추가 -> 모든 할일 가져오기 - 에러함께
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithAsyncWithError(title: String,
                                      isDone: Bool = false) async throws -> [Todo]{
        
        // 1번 끝나고
        let firstResult = try await addATodoWithAsync(title: title)
        
        // 2번 호출
        let secondResult = try await fetchTodosWithAsync()
        
        guard let finalResult = secondResult.data else {
            throw ApiError.noContent
        }
        
        return finalResult
    }
    
    /// 할일 추가 -> 모든 할일 가져오기 - NO 에러
    /// - Parameters:
    ///   - title:
    ///   - isDone:
    ///   - completion:
    static func addATodoAndFetchTodosWithAsyncNoError(title: String,
                                      isDone: Bool = false) async -> [Todo]{
        
        do {
            
            // 1번 끝나고
            let firstResult = try await addATodoWithAsync(title: title)
            
            // 2번 호출
            let secondResult = try await fetchTodosWithAsync()
            
            guard let finalResult = secondResult.data else {
                return []
            }
            
            return finalResult
            
        } catch {
            if let _ = error as? ApiError {
                return []
            }
            
            return []
        }
    }
    
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithAsyncNoError(selectedTodoIds: [Int]) async -> [Int]{
        
        async let firstResult = self.deleteATodoWithAsync(id: 1641)
        async let secondResult = self.deleteATodoWithAsync(id: 1620)
        async let thirdResult = self.deleteATodoWithAsync(id: 1618)
        
        do {
            let results : [Int?] = try await[firstResult.data?.id,
                                             secondResult.data?.id,
                                             thirdResult.data?.id]
            return results.compactMap{ $0 }
        } catch {
            
            if let _ = error as? URLError {
                return []
            }
            
            if let _ = error as? ApiError {
                return []
            }
            return []
        }
    }
    
    /// 클로져 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithAsyncWithError(selectedTodoIds: [Int]) async throws -> [Int]{
        
        async let firstResult = self.deleteATodoWithAsync(id: 1641)
        async let secondResult = self.deleteATodoWithAsync(id: 1617)
        async let thirdResult = self.deleteATodoWithAsync(id: 1616)
        
        
        let results : [Int?] = try await[firstResult.data?.id,
                                         secondResult.data?.id,
                                         thirdResult.data?.id]
        return results.compactMap{ $0 }
    }
    
    /// Async 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithAsyncTaskGroupWithError(selectedTodoIds: [Int]) async throws -> [Int]{
        
        
        try await withThrowingTaskGroup(of: Int?.self) { (group : inout ThrowingTaskGroup<Int?, Error>) -> [Int] in
            
            // 각각 자식 async 태스크를 그룹에 넣기
            for aTodoId in selectedTodoIds {
                group.addTask(operation: {
                    // 단일 api 쏘기
                    let childTaskResult = try await self.deleteATodoWithAsync(id: aTodoId)
                    return childTaskResult.data?.id
                })
            }
            
            var deleteTodoIds : [Int] = []
            
            for try await singleValue in group {
                if let value = singleValue {
                    deleteTodoIds.append(value)
                }
            }
            
            return deleteTodoIds
        }
    }
    
    
    /// Async 기반 api 동시 처리
    /// 선택된 할일들 삭제하기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 실제 삭제가 완료된 아이디들
    static func deleteSelectedTodosWithAsyncTaskGroupNoError(selectedTodoIds: [Int]) async -> [Int]{
        
        
        await withTaskGroup(of: Int?.self) { (group : inout TaskGroup<Int?>) -> [Int] in
            
            // 각각 자식 async 태스크를 그룹에 넣기
            for aTodoId in selectedTodoIds {
                group.addTask(operation: {
                    do {
                        // 단일 api 쏘기
                        let childTaskResult = try await self.deleteATodoWithAsync(id: aTodoId)
                        return childTaskResult.data?.id
                    } catch {
                        return nil
                    }
                })
            }
            
            var deleteTodoIds : [Int] = []
            
            for await singleValue in group {
                if let value = singleValue {
                    deleteTodoIds.append(value)
                }
            }
            return deleteTodoIds
        }
    }
    
    
    /// Async 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodosAsyncNoError(selectedTodoIds: [Int]) async -> [Todo]{
        
        
        await withTaskGroup(of: Todo?.self) { (group : inout TaskGroup<Todo?>) -> [Todo] in
            
            // 각각 자식 async 태스크를 그룹에 넣기
            for aTodoId in selectedTodoIds {
                group.addTask(operation: {
                    do {
                        // 단일 api 쏘기
                        let childTaskResult = try await self.fetchATodoWithAsync(id: aTodoId)
                        return childTaskResult.data
                    } catch {
                        return nil
                    }
                })
            }
            
            var fetchedTodos : [Todo] = []
            
            for await singleValue in group {
                if let value = singleValue {
                    fetchedTodos.append(value) // Todo
                }
            }
            return fetchedTodos
        }
    }
    
    /// Async 기반 api 동시 처리
    /// 선택된 할일들 가져오기
    /// - Parameters:
    ///   - selectedTodoIds: 선택된 할일 아이디들
    ///   - completion: 응답 결과
    static func fetchSelectedTodosAsyncWithError(selectedTodoIds: [Int]) async throws -> [Todo]{
        
        try await withThrowingTaskGroup(of: Todo?.self, body: { (group: inout ThrowingTaskGroup<Todo?, Error>) in
            
            for aTodoId in selectedTodoIds {
                group.addTask(operation: {
                    let childTaskResult = try await self.fetchATodoWithAsync(id: aTodoId)
                    return childTaskResult.data
                })
            }
            
            var fetchedTodos : [Todo] = []
            
            for try await singleValue in group {
                if let value = singleValue {
                    fetchedTodos.append(value) // Todo
                }
            }
            return fetchedTodos
        })
    }
    
}

//MARK: - Async to Combine
extension TodosAPI {
    
    static func fetchTodosAsyncToPublisher(page: Int) -> AnyPublisher<BaseListResponse<Todo>, Error> {
        
        return Future { (promise: @escaping (Result<BaseListResponse<Todo>, Error>) -> Void) in
            Task{
                do {
                    let asyncResult = try await fetchTodosWithAsync(page: page)
                    
                    promise(.success(asyncResult))
                    
                } catch {
                    
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    static func genericAsyncToPublisher<T>(asyncWork: @escaping () async throws -> T) -> AnyPublisher<T, Error> {
        
        return Future { (promise: @escaping (Result<T, Error>) -> Void) in
            Task{
                do {
                    let asyncResult = try await asyncWork()
                    
                    promise(.success(asyncResult))
                    
                } catch {
                    
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}


extension Publisher {
    
    func mapAsync<T>(asyncWork: @escaping (Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        
        return flatMap { output in
            return Future { (promise: @escaping (Result<T, Error>) -> Void) in
                Task{
                    do {
                        let asyncResult = try await asyncWork(output)
                        
                        promise(.success(asyncResult))
                        
                    } catch {
                        
                        promise(.failure(error))
                    }
                }
            }
        }
    }
    
}


//MARK: - Async to Rx Observable
extension TodosAPI {
    
    static func fetchTodosAsyncToObservable(page: Int) -> Observable<BaseListResponse<Todo>> {
        
        return Observable.create {  (observer : AnyObserver<BaseListResponse<Todo>>) in
            Task{
                do {
                    let asyncResult = try await fetchTodosWithAsync(page: page)
                    observer.onNext(asyncResult)
                    observer.onCompleted()
                } catch {
                    
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    static func genericAsyncToObservable<T>(asyncWork: @escaping () async throws -> T) -> Observable<T> {
        
        return Observable.create {  (observer : AnyObserver<T>) in
            Task{
                do {
                    let asyncResult = try await asyncWork()
                    observer.onNext(asyncResult)
                    observer.onCompleted()
                } catch {
                    
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

extension ObservableType {
    
    func mapAsync<T>(asyncWork: @escaping (Element) async throws -> T) -> Observable<T> {
        
        return flatMap { element in
            return Observable.create {  (observer : AnyObserver<T>) in
                Task{
                    do {
                        let asyncResult = try await asyncWork(element)
                        observer.onNext(asyncResult)
                        observer.onCompleted()
                    } catch {
                        
                        observer.onError(error)
                    }
                }
                return Disposables.create()
            }
        }
    }
}


//MARK: - Acync Retry

extension Task where Failure == Error {
    
    enum TaskRetryError : Error {
        case maxRetryRequest
    }
    
    static func retry(retryCount: Int = 1,
                      delay: Int = 1,
                      when: ((Error) -> Bool)? = nil,
                      asyncWork: @Sendable @escaping () async throws -> Success
    ) -> Task {
        
        // 횟수, 딜레이, 조건
        return Task {
            for _ in 0...retryCount {
                do {
                    
                    // 성공시 리턴
                    let result = try await asyncWork()
                    print("retry - result: \(result)")
                    return result
                    
                } catch {
                    print("retry - error: \(error)")
                    
                    // 특정 조건일 때
                    guard (when?(error) ?? true) else {
                        throw error
                    }
                    
                    // 딜레이
                    try await Task<Never, Never>.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                    // 위로
                    continue
                }
            }
            throw TaskRetryError.maxRetryRequest
        }// Task
    }
    
    
}
