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

    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return ""}
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}

extension ToDoData : Identifiable {

}
