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
        TodosAPI.fetchTodos { result in
            switch result {
            case .success(let todosResponse):
                print(#fileID, #function, #line, "- ")
                print(todosResponse)
            case .failure(let failure):
                print(#fileID, #function, #line, "- ")
                print(failure)
            }
            
        }
    }
    
}
