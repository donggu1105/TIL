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
        TodosAPI.fetchTodos()
    }
    
}
