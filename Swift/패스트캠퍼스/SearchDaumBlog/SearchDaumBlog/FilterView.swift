//
//  FilterView.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/19.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class FilterView: UITableView {
    let disposeBag = DisposeBag()
    
    let sortButton = UIButton()
    let bottomBorder = UIView()
    
    
    // FilterView 외부에서 관찰
    let sortButtonTapped = PublishRelay<Void>()
    
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier:reuseIdentifier)
        
        bind()
        attribute()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        sortButton.rx.tap
            .bind(to: sortButtonTapped)
            .disposed(by: disposeBag)
        
    }
    private func attribute() {
        
        sortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        bottomBorder.backgroundColor = .lightGray
    }
    private func layout() {
        
        [sortButton, bottomBorder]
            .forEach {
                addSubview($0)
            }
        
        sortButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(28)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.top.equalTo(sortButton.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
    }
}
