//
//  TableViewCell.swift
//  MemberList
//
//  Created by web_dev on 2022/12/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            
            guard var member = member else {return}
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    
    
    //MARK: - 멤버 저장속성 구현
    // 멤버가 변할때마다 자동으로 업데이트 되도록 구현 didSet(속성 감시자) ⭐️
//    var member: Member? {
//        didSet {
//            guard var member = member else { return }
//            mainImageView.image = member.memberImage
//            memberNameLabel.text = member.name
//            addressLabel.text = member.address
//        }
//    }
    
    //MARK: - UI구현
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStackView() {
        self.addSubview(mainImageView)

        // 셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    //MARK: - 오토레이아웃 셋팅
    // 오토레이아웃 정하는 정확한 시점
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            
            // self.leadingAnchor로 잡는 것보다 self.contentView.leadingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            
            // self.trailingAnchor로 잡는 것보다 self.contentView.trailingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
