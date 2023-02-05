//
//  TodoCell.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/10.
//

import Foundation
import UIKit

class TodoCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var selectionSwitch: UISwitch!
    
    var cellData: Todo? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
    }
    
    
    // 셀 데이터 적용
    func updateUI(_ cellData: Todo) {
        
        guard var id: Int = cellData.id,
              var title: String = cellData.title
        else {
            print("id, title 이 없습니다")
            return
        }
        
        self.cellData = cellData
        
        self.titleLabel.text = "아이디: \(cellData.id)"
        self.contentLabel.text = cellData.title
    }
    
    
    @IBAction func onEditBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <#comment#>")
    }
    
    
    @IBAction func onDeleteBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <#comment#>")
    }
    
}
