//
//  MusicManager.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/23.
//

import UIKit
import CoreData

//MARK: - 데이터 관리 모델 (전체 관리)

final class MusicManager {
    
    // 저장된 데이터, 서버에서 받아오는 데이터 등, 여러화면의 모든 것을 관리하니 싱글톤으로 만듦
    static let shared = MusicManager()
    
    // 초기화할때 저장된 데이터 셋팅
    private init() {
        fetchMusicsFromCoreData {
            print("저장된 데이터셋팅완료")
        }
    }
    
    // 네트워크 매니저 (싱글톤)
    private let networkManager = NetworkManager.shared
    
    // 코어데이터 매니저 (싱글톤)
    private let coredataManager = CoreDataManager.shared
    
    // 서버에서 받아온 음악 배열 (첫번째탭 표시하기 위한)
    private var musicArrays: [Music] = []
    
    // 코어데이터에 저장하기 위한 음악 배열 (저장된 데이터 관리 / 두번째 탭 표시하기 위한)
    private var musicSavedArrays: [MusicSaved] = []
    
    func getMusicArraysFromAPI() -> [Music] {
        return musicArrays
    }
    
    func getMusicDatasFromCoreData() -> [MusicSaved] {
        return musicSavedArrays
    }
    
    //MARK: - API 통신 관련 메서드
    // (기본 단어로) 데이터 셋업하기
    func setupDatasFromAPI(completion: @escaping () -> Void) {
        print("시작")
        getDatasFromAPI(with: "jazz") {
            completion()
        }
    }
    
    // (특정 단어로) 검색하기
    func fetchDatasFromAPI(withATerm searchTerm: String, completion: @escaping () -> Void) {
        getDatasFromAPI(with: searchTerm) {
            completion()
        }
    }
    
    // 네트워크 매니저한테 요청해서 (서버에서) 데이터 가져오기
    private func getDatasFromAPI(with searchTerm: String, completion: @escaping () -> Void) {
        networkManager.fetchMusic(searchTerm: searchTerm) { result in
            switch result {
            case .success(let musicDatas):
                self.musicArrays = musicDatas
                self.checkWhetherSaved()
                completion()
            case .failure(let error):
                print(error.localizedDescription)
                self.checkWhetherSaved()
                completion()
            }
        }
    }
    
    //MARK: - 코어데이터와 커뮤니케이션하는 메서드
    // 처음 셋팅하는 메서드
    private func setupDatasFromCoreData(completion: () -> Void) {
        fetchMusicsFromCoreData {
            completion()
        }
    }
    
    // Create (데이터 생성하기)
    func saveMusicData(with music: Music, messege: String?, completion: @escaping () -> Void) {
        coredataManager.saveMusic(with: music, messege: messege) {
            self.fetchMusicsFromCoreData {
                completion()
            }
        }
    }
    
    // Delete (Music타입을 가지고 데이터 지우기) ==> 저장되어 있는지 확인하고 지우기
    func deleteMusic(with music: Music, completion: @escaping () -> Void) {
        // 동일한 데이터(제목&가수이름)를 가진 것들을 찾아내서 (배열로 리턴)
        let musicsSaved = musicSavedArrays.filter { $0.songName == music.songName && $0.artistName == music.artistName
        }
        // 전달
        if let targetMusicSaved = musicsSaved.first {
            self.deleteMusicFromCoreData(with: targetMusicSaved) {
                print("지우기 완료")
                completion()
            }
        } else {
            print("저장된 것 없음")
            completion()
        }
    }
    
    // Delete (데이터 지우기) - MusicSaved타입을 가지고 데이터 지우기
    func deleteMusicFromCoreData(with music: MusicSaved, completion: @escaping () -> Void) {
        coredataManager.deleteMusic(with: music) {
            self.fetchMusicsFromCoreData {
                completion()
            }
        }
    }
    
    // Update (수정하기)
    func updateMusicToCoreData(with music: MusicSaved, completion: @escaping () -> Void) {
        coredataManager.updateMusic(with: music) {
            self.fetchMusicsFromCoreData {
                completion()
            }
        }
    }
    
    // Read (데이터 불러오기) (코어데이터에서 가져와서 ====> 현재 모델의 배열에 저장)
    private func fetchMusicsFromCoreData(completion: () -> Void) {
        musicSavedArrays = coredataManager.getMusicSavedArrayFromCoreData()
        completion()
    }
    
    // 이미 저장된 데이터들인지 확인 (저장 여부 확인) (저장여부 확인해야지, 하트 표시 가능하기 때문에) ⭐️
    func checkWhetherSaved() {
        musicArrays.forEach { music in
            //코어데이터에 저장된 것들 중 음악 및 가수 이름이 같은 것 찾아내서
            if musicSavedArrays.contains(where: {
                $0.songName == music.songName && $0.artistName == music.artistName
            }) {
                // 이미 저장되어있는 데이터라고 설정
                music.isSaved = true
            }
        }
    }
}
