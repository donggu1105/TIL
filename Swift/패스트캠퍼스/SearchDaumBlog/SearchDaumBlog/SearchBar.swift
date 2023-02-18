//
//  SearchBar.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/19.
//
import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SearchBar: UISearchBar {
    

    let disposeBag = DisposeBag()
    
    let searchButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame:frame)
        bind()
        attribute()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // SearchBar 버튼 탭 이벤트
    let searchButtonTapped = PublishRelay<Void>()
    
    // SearchBar 외부로 내보낼 이벤트
    var shouldLoadResult = Observable<String>.of("")
    
    private func bind() {
        // 2가지
        // 1. search bar enter 눌렸을떄
        // 2. 검색 버튼 눌렸을때
        // ==> observable 순서와상관없이 어느 observable이든 발생되면 전부 탭이벤트
        
        Observable
            .merge(
                self.rx.searchButtonClicked.asObservable(),
                searchButton.rx.tap.asObservable()
            )
            .bind(to: searchButtonTapped)
            .disposed(by: disposeBag)
        
        // 탭 이벤트 발생시 키보드 아래로 내려가는거 구현
        searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(self.rx.text) { $1 ?? "" }
            .filter {!$0.isEmpty }
            .distinctUntilChanged()
        
    }
    
    private func attribute() {
        searchButton.setTitle("검ㅅ개", for: .normal)
        searchButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    private func layout() {
        addSubview(searchButton)
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        
    }
}

extension Reactive where Base: SearchBar {
    var endEditing: Binder<Void> {
        return Binder(base) { base, _ in
            base.endEditing(true)
            
        }
    }
}
