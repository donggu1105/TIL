//
//  BlogListCellData.swift
//  SearchDaumBlog
//
//  Created by 강동현 on 2023/02/20.
//

import Foundation

struct BlogListCellData {
    let thumbnailURL: URL?
    let name: String?
    let title: String?
    let datetime: Date?
    
    
    var datetimeStr: String {
        guard let datetime = self.datetime else {return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: datetime)
    }
}
