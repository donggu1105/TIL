//
//  BlogListViewModel.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import Foundation
import RxCocoa
import RxSwift

struct BlogListViewModel {
    
    let filterViewModel = FilterViewModel()
    
    let blogCellData = PublishSubject<[BlogListCellData]>()

    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogCellData
            .asDriver(onErrorJustReturn: [])
    }
}
