//
//  SavedListViewController.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/23.
//

import UIKit

final class SavedListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 음악 관리하는 매니저 (싱글톤)
    // 서버 데이터 및 저장된 데이터(코어 데이터) 모두 관리
    let musicManager = MusicManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
    }
    
    // 화면이 다시 나타날때마다 테이블뷰 리로드 하도록 구현
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupNaviBar() {
        self.title = "Saved Music List"
    }
    
    // 테이블뷰 셋팅
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // Nib파일을 사용한다면 등록의 과정이 필요
        tableView.register(UINib(nibName: Cell.savedMusicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.savedMusicCellIdentifier)
    }

}

extension SavedListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicManager.getMusicDatasFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.savedMusicCellIdentifier, for: indexPath) as! SavedMusicCell
        
        let musicSaved = self.musicManager.getMusicDatasFromCoreData()[indexPath.row]
        cell.musicSaved = musicSaved
        
        // (어짜피 다 저장되어 있으니) 저장을 없앨 것인지 얼럿창 띄우기
        cell.saveButtonPressed = { [weak self] (senderCell) in
            guard let self = self else { return }
            self.makeRemoveCheckAlert { okAction in
                // 삭제 확인 버튼
                if okAction {
                    // 코어데이터에 삭제 하도록 전달
                    self.musicManager.deleteMusicFromCoreData(with: musicSaved) {
                        self.tableView.reloadData()
                        print("삭제 및 테이블뷰 리로드 완료")
                    }
                } else {
                    print("삭제 취소")
                }
            }
        }
        
        // 수정관련 얼럿창 띄우기
        cell.updateButtonPressed = { [weak self] (senderCell, messege) in
            guard let self = self else { return }
            self.makeMessegeAlert(myMessege: messege) { updatedMessege, okAction in
                // 수정 확인 버튼
                if okAction {
                    // 새로운 메세지로 바꾸고
                    senderCell.musicSaved?.myMessege = updatedMessege
                    // 옵셔널 바인딩해서 코어데이터에 업데이트 하도록 전달
                    guard let musicSaved = senderCell.musicSaved else { return }
                    self.musicManager.updateMusicToCoreData(with: musicSaved) {
                        senderCell.configureUIwithData()
                        print("셀 표시 다시하기 완료")
                    }
                // 수정 취소
                } else {
                    print("업데이트 취소됨")
                }
            }
        }
        return cell
    }
    
    func makeRemoveCheckAlert(completion: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "저장 음악 삭제", message: "정말 저장된 음악을 지우시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { okAction in
            completion(true)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancelAction in
            completion(false)
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func makeMessegeAlert(myMessege messege: String?, completion: @escaping (String?, Bool) -> Void) {
        let alert = UIAlertController(title: "음악 관련 메세지", message: "음악과 함께 저장하려는 문장을 입력하세요.", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = messege
        }
        var savedText: String? = ""
        let ok = UIAlertAction(title: "확인", style: .default) { okAction in
            savedText = alert.textFields?[0].text
            completion(savedText, true)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancelAction in
            completion(nil, false)
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension SavedListViewController: UITableViewDelegate {
    // 테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // 유저가 스크롤하는 것이 끝나려는 시점에 호출되는 메서드
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        UIView.animate(withDuration: 0.3) {
            guard velocity.y != 0 else { return }
            if velocity.y < 0 {
                let height = self.tabBarController?.tabBar.frame.height ?? 0.0
                self.tabBarController?.tabBar.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.maxY - height)
            } else {
                self.tabBarController?.tabBar.frame.origin = CGPoint(x: 0, y: UIScreen.main.bounds.maxY)
            }
        }
    }
}
