//
//  MusicCell.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/20.
//

import UIKit


final class MusicCell: UITableViewCell {

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var saveButton: UIButton!
    
    var music: Music? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달하고, 저장여부도 전달)
    var saveButtonPressed: ((MusicCell, Bool) -> ()) = { (sender, pressed) in }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.mainImageView.image = nil
    }
    
    // 스토리보드 또는 Nib으로 만들때, 사용하게 되는 생성자 메서드
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        saveButton.setImage(UIImage(systemName: "heart"), for: .normal)
        saveButton.tintColor = .gray
        mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureUIwithData() {
        guard let music = music else { return }
        loadImage(with: music.imageUrl)
        songNameLabel.text = music.songName
        artistNameLabel.text = music.artistName
        albumNameLabel.text = music.albumName
        releaseDateLabel.text = music.releaseDateString
        setButtonStatus()
    }
    
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage(with imageUrl: String?) {
        guard let urlString = imageUrl, let url = URL(string: urlString)  else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let isSaved = music?.isSaved else { return }
        
        // 뷰컨트롤로에서 전달받은 클로저를 실행 (내 자신 MusicCell/저장여부 전달하면서) ⭐️
        saveButtonPressed(self, isSaved)
        // 다시 저장 여부 셋팅
        setButtonStatus()
    }
    
    func setButtonStatus() {
        guard let isSaved = self.music?.isSaved else { return }
        // 저장이 되지 않았으면
        if !isSaved {
            saveButton.setImage(UIImage(systemName: "heart"), for: .normal)
            saveButton.tintColor = .gray
        // 저장이 되어 있으면
        } else {
            saveButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            saveButton.tintColor = .red
        }
    }
    
}
