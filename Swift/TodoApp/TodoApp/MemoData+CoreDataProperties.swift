//
//  MemoData+CoreDataProperties.swift
//  TodoApp
//
//  Created by web_dev on 2022/12/23.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var color: Int64
    @NSManaged public var date: Date?

}

extension MemoData : Identifiable {

}
