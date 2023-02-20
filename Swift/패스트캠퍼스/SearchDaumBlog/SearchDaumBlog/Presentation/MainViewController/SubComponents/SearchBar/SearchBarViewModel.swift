//
//  SearchBarViewModel.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import Foundation
import RxSwift
import RxCocoa


struct SearchBarViewModel {
    
    let queryText = PublishRelay<String?>()
    
    // SearchBar 버튼 탭 이벤트
    let searchButtonTapped = PublishRelay<Void>()
    
    // SearchBar 외부로 내보낼 이벤트
    var shouldLoadResult: Observable<String>
    
    init() {
        
        
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) { $1 ?? "" }
            .filter {!$0.isEmpty }
            .distinctUntilChanged()
        
    }
    
    
}
