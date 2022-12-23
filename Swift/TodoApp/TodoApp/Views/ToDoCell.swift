//
//  ToDoCell.swift
//  TodoApp
//
//  Created by web_dev on 2022/12/23.
//

import UIKit

final class ToDoCell: UITableViewCell {
    

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달)
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in }
    
    var toDoData: ToDoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    func configureUIwithData() {
        toDoTextLabel.text = toDoData?.memoText
        dateTextLabel.text = toDoData?.dateString
        guard let colorNum = toDoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        backView.backgroundColor = color.backgoundColor
        
    }
    
    func configureUI() {
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func updateButtonTapped(_ sender: UIButton) {
        // 뷰컨트롤로에서 전달받은 클로저를 실행 (내 자신 ToDoCell을 전달하면서) ⭐️
        updateButtonPressed(self)
    }
}
