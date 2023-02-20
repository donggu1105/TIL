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
        
        attribute()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func bind(_ viewModel: SearchBarViewModel) {
        // 2가지
        // 1. search bar enter 눌렸을떄
        // 2. 검색 버튼 눌렸을때
        // ==> observable 순서와상관없이 어느 observable이든 발생되면 전부 탭이벤트
        
        self.rx.text
            .bind(to: viewModel.queryText)
            .disposed(by: disposeBag)
        
        Observable
            .merge(
                self.rx.searchButtonClicked.asObservable(),
                searchButton.rx.tap.asObservable()
            )
            .bind(to: viewModel.searchButtonTapped)
            .disposed(by: disposeBag)
        
        // 탭 이벤트 발생시 키보드 아래로 내려가는거 구현
        viewModel.searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        

    }
    
    private func attribute() {
        searchButton.setTitle("검색", for: .normal)
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
