//
//  TodoVM.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/18.
//

import Foundation
import Combine
import RxSwift
import RxCocoa
import RxRelay

// ObservableObject 해야 변경에 대한 감지 가능
class TodosVM: ObservableObject {
    
    var disposeBag = DisposeBag()
    
    init() {
        print(#fileID, #function, #line, "- ")
        
        TodosAPI.fetchTodosWithObservable(page: 111)
            .retryWithDelayAndCondition(retryCount: 3, delay: 2, when: {err in
                print("err : \(err)")
                
                if case TodosAPI.ApiError.unauthorized = err {
                    return true
                }
                return false
            })
            .subscribe(onNext: {
                print("onNext : \($0)")
            })
            .disposed(by: disposeBag)
        
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
