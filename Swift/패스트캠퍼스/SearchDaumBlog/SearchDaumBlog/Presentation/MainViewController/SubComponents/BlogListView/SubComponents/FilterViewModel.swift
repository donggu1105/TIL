//
//  FilterViewModel.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import Foundation
import RxSwift
import RxCocoa


class FilterViewModel {
    
    // FilterView 외부에서 관찰
    let sortButtonTapped = PublishRelay<Void>()
    
    init() {
        
    }
    
}
