//
//  MainViewModel.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import Foundation
import RxSwift
import RxCocoa

struct MainViewModel {
    
    let disposeBag = DisposeBag()
    
    
    let blogListViewModel = BlogListViewModel()
    let searchBarViewModel = SearchBarViewModel()
    
    let shouldPresentAler: Signal<MainViewController.Alert>
    
    
    let alertActionTapped = PublishRelay<MainViewController.AlertAction>()
    
    
    
    init(model: MainModel = MainModel()) {
        
        
        let blogResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest(model.searchBlog)
            .share()
        
        
        let blogValue = blogResult
            .compactMap(model.getBlogValue)
        
        
        let blogError = blogResult
            .compactMap(model.getBlogError)
        
        // 네트워크를 통해 가져온 값을 cellData로 바꾸기
        
        let cellData = blogValue
            .map(model.getBlogListCellData)
        
        
        // FilterView 에서 나오는 alertSheet 선택했을때 type
        let sortedType = alertActionTapped
            .filter {
                switch $0 {
                case .datetime, .title:
                    return true
                default:
                    return false
                }
            }
            .startWith(.title)
        
        
        // MainController -> ListView
        
        Observable
            .combineLatest(sortedType, cellData, resultSelector: model.sort)
            .bind(to: blogListViewModel.blogCellData)
            .disposed(by: disposeBag)
        
        
        let alertForErrorMessage = blogError
            .map { message -> MainViewController.Alert in
                return (
                    title: "앗!",
                    message: "예상치 못한 오류 발생 \(message)",
                    actions: [.confirm],
                    style: .alert
                )
            }
        
        let alertSheetForSorting = blogListViewModel.filterViewModel.sortButtonTapped
            .map { _ -> MainViewController.Alert in
                return (title: nil, message: nil, actions: [.title, .datetime, . cancel], style: .actionSheet)
            }
        
        
        self.shouldPresentAler = Observable
            .merge(alertSheetForSorting, alertForErrorMessage)
            .asSignal(onErrorSignalWith: .empty())
    }
    
}
