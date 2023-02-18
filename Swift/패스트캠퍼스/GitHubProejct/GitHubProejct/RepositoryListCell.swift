//
//  RepositoryListCell.swift
//  GitHubProejct
//
//  Created by 강동현 on 2023/02/15.
//

import UIKit
import SnapKit

class RepositoryListCell: UITableViewCell {
    
    
    var repository: String?
    
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let starImageView = UIImageView()
    let startLabel = UILabel()
    let languageLable = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        [nameLabel,
        descriptionLabel,
        starImageView,
        startLabel,
        languageLable]
            .forEach {
                contentView.addSubview($0)
                
            }
    }
    
}
