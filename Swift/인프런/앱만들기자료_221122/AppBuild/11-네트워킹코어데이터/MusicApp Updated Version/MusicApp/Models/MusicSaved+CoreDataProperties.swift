//
//  MusicSaved+CoreDataProperties.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/23.
//
//

import Foundation
import CoreData


extension MusicSaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicSaved> {
        return NSFetchRequest<MusicSaved>(entityName: "MusicSaved")
    }

    @NSManaged public var songName: String?
    @NSManaged public var artistName: String?
    @NSManaged public var albumName: String?
    @NSManaged public var releaseDate: String?
    
    @NSManaged public var imageUrl: String?
    @NSManaged public var previewUrl: String?
    
    @NSManaged public var savedDate: Date?
    
    var savedDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = savedDate else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
    
    @NSManaged public var myMessege: String?
    
}

extension MusicSaved : Identifiable {

}
