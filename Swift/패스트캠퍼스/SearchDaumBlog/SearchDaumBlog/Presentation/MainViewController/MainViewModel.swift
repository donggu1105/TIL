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
    
    
    
    init() {
        
        
        let blogResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest { query in
                SearchBlogNetwork().searchBlog(query: query)
            }
            .share()
        
        
        let blogValue = blogResult
            .compactMap { data -> DKBlog? in
                guard case .success(let value) = data else {return nil}
                return value
            }
        let blogError = blogResult
            .compactMap { data -> String? in
                guard  case .failure(let error) = data else {return nil}
                return error.localizedDescription
            }
        
        
        
        
        // 네트워크를 통해 가져온 값을 cellData로 바꾸기
        
        let cellData = blogValue
            .map {blog -> [BlogListCellData] in
                return blog.documents
                    .map { doc in
                        let thumbnailURL = URL(string: doc.thumbnail ?? "")
                        return BlogListCellData(thumbnailURL: thumbnailURL, name: doc.name, title: doc.title, datetime: doc.datetime)
                        
                    }
            }
        
        
        
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
            .combineLatest(sortedType, cellData) { type, data -> [BlogListCellData] in
                
                switch type {
                case .title:
                    return data.sorted { $0.title ?? "" < $1.title ?? "" }
                case .datetime:
                    return data.sorted {$0.datetime ?? Date() > $1.datetime ?? Date() }
                default: return data
                }
            }
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
