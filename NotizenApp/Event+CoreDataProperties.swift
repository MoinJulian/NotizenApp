//
//  Event+CoreDataProperties.swift
//  NotizenApp
//
//  Created by Julian on 21/06/2024.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var bezeichnung: String?
    @NSManaged public var id: UUID?
    @NSManaged public var origin: Notiz?

}

extension Event : Identifiable {

}
