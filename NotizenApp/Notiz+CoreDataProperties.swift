//
//  Notiz+CoreDataProperties.swift
//  NotizenApp
//
//  Created by Julian on 21/06/2024.
//
//

import Foundation
import CoreData


extension Notiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notiz> {
        return NSFetchRequest<Notiz>(entityName: "Notiz")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var inhalt: String?
    @NSManaged public var events: NSSet?
    
    var getEvents: [Event] {
        get {
            return events?.allObjects as? [Event] ?? []
        }
    }

}

// MARK: Generated accessors for events
extension Notiz {

    @objc(addEventsObject:)
    @NSManaged public func addToEvents(_ value: Event)

    @objc(removeEventsObject:)
    @NSManaged public func removeFromEvents(_ value: Event)

    @objc(addEvents:)
    @NSManaged public func addToEvents(_ values: NSSet)

    @objc(removeEvents:)
    @NSManaged public func removeFromEvents(_ values: NSSet)

}

extension Notiz : Identifiable {

}
