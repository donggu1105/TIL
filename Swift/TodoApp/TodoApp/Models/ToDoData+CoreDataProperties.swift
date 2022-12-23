//
//  ToDoData+CoreDataProperties.swift
//  TodoApp
//
//  Created by web_dev on 2022/12/23.
//
//

import Foundation
import CoreData


extension ToDoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoData> {
        return NSFetchRequest<ToDoData>(entityName: "ToDoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var color: Int64
    @NSManaged public var date: Date?

}

extension ToDoData : Identifiable {

}
