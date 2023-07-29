//
//  Game+CoreDataProperties.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }
    
    @NSManaged public var currentHole: Int16
    @NSManaged public var active: Bool
    @NSManaged public var playersActive: Int16
    @NSManaged public var courseName: String?
    @NSManaged public var date: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var gameNotes: String?
    @NSManaged public var id: UUID?
    @NSManaged public var p1Name: String?
    @NSManaged public var p2Name: String?
    @NSManaged public var p3Name: String?
    @NSManaged public var p4Name: String?
    @NSManaged public var screenGolf: Bool
    @NSManaged public var startTime: Date?
    @NSManaged public var hole: NSSet?
    @NSManaged public var p1Score: Int16
    @NSManaged public var p2Score: Int16
    @NSManaged public var p3Score: Int16
    @NSManaged public var p4Score: Int16
    
    
    
    var wrappedP1Name:String {
        p1Name ?? "P1"
    }
    
    var wrappedP2Name:String {
        p2Name ?? "p2"
    }
    
    var wrappedP3Name: String {
        p3Name ?? "p3"
    }
    
    var wrappedp4Name: String {
        p4Name ?? "p4"
    }
    
    var wrappedCourseName: String {
        courseName ?? "Course Unnamed"
    }
    
    var wrappedHoleArray: [Hole] {
        let set = hole as? Set<Hole> ?? []
        return set.sorted() {
            $0.number < $1.number
        }
    }
    
    
    
    

}

// MARK: Generated accessors for hole
extension Game {

    @objc(addHoleObject:)
    @NSManaged public func addToHole(_ value: Hole)

    @objc(removeHoleObject:)
    @NSManaged public func removeFromHole(_ value: Hole)

    @objc(addHole:)
    @NSManaged public func addToHole(_ values: NSSet)

    @objc(removeHole:)
    @NSManaged public func removeFromHole(_ values: NSSet)

}

extension Game : Identifiable {

}
