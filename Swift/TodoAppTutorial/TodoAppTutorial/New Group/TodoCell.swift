//
//  TodoCell.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/13.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var selectionSwitch: UISwitch!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onEditButtonClicked(_ sender: UIButton) {
        
        
    }
    
    @IBAction func onDeleteButtonClicked(_ sender: UIButton) {
    }
    
    
    
    
    
}
