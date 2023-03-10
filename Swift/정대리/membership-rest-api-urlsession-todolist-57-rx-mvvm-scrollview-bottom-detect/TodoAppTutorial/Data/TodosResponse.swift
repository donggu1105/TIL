//
//  TodosResponse.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/20.
//

import Foundation

// MARK: - TodosResponse
// JSON -> struct, class : 디코딩한다
struct TodosResponse: Decodable {
    let data: [Todo]?
    let meta: Meta?
    let message: String?
//    let hey: String
}

struct BaseListResponse<T: Codable>: Codable {
    let data: [T]?
    let meta: Meta?
    let message: String?
//    let hey: String
}

struct BaseResponse<T: Codable>: Codable {
    let data: T?
    let message: String?
//    let code: String?
}

// MARK: - Datum
struct Todo: Codable {
    let id: Int?
    let title: String?
    let isDone: Bool?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case isDone = "is_done"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage, perPage: Int?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to, total
    }
    
    
    /// 다음페이지가 있는지 여부
    /// - Returns: 다음페이지 존재 여부
    func hasNext() -> Bool {
        guard let current = currentPage,
              let last = lastPage else {
            print("current, last 페이지 정보 없음")
            return false
        }
        return current < last
    }
}
