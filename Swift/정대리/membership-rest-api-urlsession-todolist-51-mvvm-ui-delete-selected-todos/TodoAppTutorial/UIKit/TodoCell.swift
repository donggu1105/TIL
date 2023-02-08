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
    
    var cellData : Todo? = nil
    
    // 삭제액션
    var onDeleteActionEvent: ((Int) -> Void)? = nil
    
    // 수정액션
    var onEditActionEvent: ((_ id: Int, _ title: String) -> Void)? = nil
    
    // 선택액션
    var onSelectedActionEvent: ((_ id: Int, _ isOn: Bool) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        selectionSwitch.addTarget(self, action: #selector(onSelectionChanged(_:)), for: .valueChanged)
    }
    
    
    /// 쎌 데이터 적용
    /// - Parameter cellData:
    func updateUI(_ cellData: Todo, _ selectedTodoIds: Set<Int>){
        
        guard var id : Int = cellData.id,
              var title : String = cellData.title else {
            print("id, title 이 없습니다")
            return
        }
        self.cellData = cellData
        self.titleLabel.text = "아이디: \(id)"
        self.contentLabel.text = title
        self.selectionSwitch.isOn = selectedTodoIds.contains(id)
    }
    
    @objc fileprivate func onSelectionChanged(_ sender: UISwitch) {
        print(#fileID, #function, #line, "- sender.isOn: \(sender.isOn)")
        guard let id = cellData?.id else { return }
        self.onSelectedActionEvent?(id, sender.isOn)
    }
    
    @IBAction func onEditBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <#comment#>")
        
        guard let id = cellData?.id,
              let title = cellData?.title else { return }
        
        self.onEditActionEvent?(id, title)
    }
    
    
    @IBAction func onDeleteBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <#comment#>")
        
        guard let id = cellData?.id else { return }
        self.onDeleteActionEvent?(id)
    }
    
}
