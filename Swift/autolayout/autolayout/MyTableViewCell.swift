//
//  MyTableViewCell.swift
//  autolayout
//
//  Created by web_dev on 2023/01/05.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    
    
    // 셀이 렌더링 될때
    override func awakeFromNib() {
        print(#function)
        super.awakeFromNib()
        
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.height / 2
        
    }
}
