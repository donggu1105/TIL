//
//  TodoVM.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/18.
//

import Foundation
import Combine


// ObservableObject 해야 변경에 대한 감지 가능
class TodosVM: ObservableObject {
    
    init() {
        print(#fileID, #function, #line, "- ")
        
        TodosAPI.deleteSelectedTodos(selectedTodoIds: [2124]) { [weak self] deletedTodos in
        }
        
//        TodosAPI.addATodoAndFetchTodos(title: "!2312312") { [weak self] result in
//
//            guard let self = self else {return}
//
//            switch result {
//            case .success(let response):
//                print(#fileID, #function, #line, "- ")
//                print(response)
//            case .failure(let failure):
//                print(#fileID, #function, #line, "- ")
//                print(failure)
//                self.handleError(failure)
//            }
//        }
        
        
//        TodosAPI.deleteTodo(id:2128){ [weak self] result in
//
//                    guard let self = self else {return}
//
//                    switch result {
//                    case .success(let response):
//                        print(#fileID, #function, #line, "- ")
//                        print(response)
//                    case .failure(let failure):
//                        print(#fileID, #function, #line, "- ")
//                        print(failure)
//                        self.handleError(failure)
//                    }
//                }
        
//        TodosAPI.editTodo(id:2129, title: "ffff", isDone: false){ [weak self] result in
//
//                    guard let self = self else {return}
//
//                    switch result {
//                    case .success(let response):
//                        print(#fileID, #function, #line, "- ")
//                        print(response)
//                    case .failure(let failure):
//                        print(#fileID, #function, #line, "- ")
//                        print(failure)
//                        self.handleError(failure)
//                    }
//                }
        
//        TodosAPI.editTodoJson(id:2129, title: "허허허허허허헣", isDone: false){ [weak self] result in
//
//                    guard let self = self else {return}
//
//                    switch result {
//                    case .success(let response):
//                        print(#fileID, #function, #line, "- ")
//                        print(response)
//                    case .failure(let failure):
//                        print(#fileID, #function, #line, "- ")
//                        print(failure)
//                        self.handleError(failure)
//                    }
//                }
        
//        TodosAPI.addATodo(title: "기릿234232342", isDone: false){ [weak self] result in
//
//                    guard let self = self else {return}
//
//                    switch result {
//                    case .success(let response):
//                        print(#fileID, #function, #line, "- ")
//                        print(response)
//                    case .failure(let failure):
//                        print(#fileID, #function, #line, "- ")
//                        print(failure)
//                        self.handleError(failure)
//                    }
//                }
//
//        TodosAPI.searchTodos(searchTerm: "빡코딩") { [weak self] result in
//                guard let self = self else {return}
//
//                switch result {
//                case .success(let response):
//                    print(#fileID, #function, #line, "- ")
//                    print(response)
//                case .failure(let failure):
//                    print(#fileID, #function, #line, "- ")
//                    print(failure)
//                    self.handleError(failure)
//                }
//        }
        
//        TodosAPI.fetchATodo(id: 124) { [weak self] result in
//
//            guard let self = self else {return}
//
//            switch result {
//            case .success(let response):
//                print(#fileID, #function, #line, "- ")
//                print(response)
//            case .failure(let failure):
//                print(#fileID, #function, #line, "- ")
//                print(failure)
//                self.handleError(failure)
//            }
//        }
        
        
//        TodosAPI.fetchTodos { [weak self] result in
//
//            guard let self = self else {return}
//
//            switch result {
//            case .success(let todosResponse):
//                print(#fileID, #function, #line, "- ")
//                print(todosResponse)
//            case .failure(let failure):
//                print(#fileID, #function, #line, "- ")
//                print(failure)
//                self.handleError(failure)
//            }
//
//        }
    }

    
    fileprivate func handleError(_ err: Error) {
        
        let apiError = err as! TodosAPI.ApiError
            print(#fileID, #function, #line, "- ")
        print(apiError.info)
            switch apiError {
            
            case .noContent:
                print("컨텐츠 없음")
            case .unauthorized:
                print("인증안됨")
            default:
                print("default")
        }
    }
}
