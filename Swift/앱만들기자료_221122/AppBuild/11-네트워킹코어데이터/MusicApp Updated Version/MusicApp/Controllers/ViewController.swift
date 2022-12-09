//
//  ViewController.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/20.
//

import UIKit

final class ViewController: UIViewController {
    
    // 서치 컨트롤러 생성 ===> 네비게이션 아이템에 할당
    let searchController = UISearchController()
    
    @IBOutlet weak var musicTableView: UITableView!
    
    // 음악 관리하는 매니저 (싱글톤) 아예 음악을 전체 관리하는 것으로 대체 ⭐️
    let musicManager = MusicManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupSearchBar()
        setupTableView()
        setupDatas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        musicTableView.reloadData()
    }
    
    func setupNaviBar() {
        self.title = "Music Search"
    }
    
    // 서치바 셋팅
    func setupSearchBar() {
        // 네비게이션 아이템에 할당
        navigationItem.searchController = searchController
        
        // 서치바의 사용
        searchController.searchBar.delegate = self
    }
    
    // 테이블뷰 셋팅
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        // Nib파일을 사용한다면 등록의 과정이 필요
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    // 데이터 셋업하면 테이블뷰 리로드
    func setupDatas() {
        musicManager.setupDatasFromAPI {
            // 서버에서 데이터 다 가지고 온 다음에 테이블뷰 리로드
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicManager.getMusicArraysFromAPI().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        // 모델에서 받아온 데이터 전달
        let music = musicManager.getMusicArraysFromAPI()[indexPath.row]
        cell.music = music
        
        // (델리게이트 말고) 클로저 방식을 활용하는 것도 가능 ⭐️⭐️
        cell.saveButtonPressed = { [weak self] (senderCell, isSaved) in
            guard let self = self else { return }
            // 저장이 안되어 있던 것이면
            if !isSaved {
                // 저장하려는 알럿메세지 띄우기
                self.makeMessegeAlert { text, savedAction in
                    // 저장함(확인) 선택하면
                    if savedAction {
                        self.musicManager.saveMusicData(with: music, messege: text) {
                            // 저장여부 설정 및 버튼 스타일 바꾸기(셀이 음악 가지고 있음)
                            senderCell.music?.isSaved = true
                            // 저장 여부 바뀌었으니, 버튼 재설정
                            senderCell.setButtonStatus()
                            print("저장됨")
                        }
                    } else {
                        print("취소됨")
                    }
                }
            // 이미 저장이 되어 있던 것이면
            } else {
                // 정말 지울 것인지를 묻는 알럿메세지 띄우기
                self.makeRemoveCheckAlert { removeAction in
                    if removeAction {
                        self.musicManager.deleteMusic(with: music) {
                            senderCell.music?.isSaved = false
                            // 저장 여부 바뀌었으니, 버튼 재설정
                            senderCell.setButtonStatus()
                            print("저장된 것 삭제")
                        }
                    } else {
                        print("저장된 것 삭제하기 취소됨")
                    }
                }
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func makeMessegeAlert(completion: @escaping (String?, Bool) -> Void) {
        let alert = UIAlertController(title: "음악 관련 메세지", message: "음악과 함께 저장하려는 문장을 입력하세요.", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "저장하려는 메세지"
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
}

extension ViewController: UITableViewDelegate {
    // 테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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


//MARK: - (단순) 서치바 확장

extension ViewController: UISearchBarDelegate {
    
    // 검색(Search) 버튼을 눌렀을때 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text?.lowercased() else {
            return
        }
        print(text)
        musicManager.fetchDatasFromAPI(withATerm: text) {
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
    
    // 서치바에서 글자가 바뀔때마다 가져다가 소문자로 변환하기 (대문자 입력 막기)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText.lowercased()
    }
}

