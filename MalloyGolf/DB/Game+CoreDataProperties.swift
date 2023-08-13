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
    @NSManaged public var p1FinalScore: Int16
    
    
    

    
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
    
    var p1Total: Int {
        var score = 0
        for num in wrappedHoleArray {
            score = score + Int(num.p1Score)
        }
        
        return score
    }
    
    var p2Total: Int {
        var score = 0
        for num in wrappedHoleArray {
            score = score + Int(num.p2Score)
        }
        
        return score
    }
    
    var p3Total: Int {
        var score = 0
        for num in wrappedHoleArray {
            score = score + Int(num.p3Score)
        }
        
        return score
    }
    
    var p4Total: Int {
        var score = 0
        for num in wrappedHoleArray {
            score = score + Int(num.p4Score)
        }
        
        return score
    }
    
    var parTotal: Int {
        var total = 0
        for hole in wrappedHoleArray {
            total = total + Int(hole.par)
        }
        
        return total
    }
    
    var p1FrontNine: Int {
        var total = 0
        for hole in wrappedHoleArray {
            if hole.number < 9 {
                total = total + Int(hole.p1Score)
            }
        }
        return total
        
    }
    
    var p2FrontNine: Int {
        var total = 0
        for hole in wrappedHoleArray {
            if hole.number < 9 {
                total = total + Int(hole.p2Score)
            }
        }
        return total
        
    }
    
    var p3FrontNine: Int {
        var total = 0
        for hole in wrappedHoleArray {
            if hole.number < 9 {
                total = total + Int(hole.p3Score)
            }
        }
        return total
        
    }
    
    var p4FrontNine: Int {
        var total = 0
        for hole in wrappedHoleArray {
            if hole.number < 9 {
                total = total + Int(hole.p4Score)
            }
        }
        return total
        
    }
    
    var parFrontNine: Int {
        var total = 0
        for hole in wrappedHoleArray {
            if hole.number < 9 {
                total = total + Int(hole.par)
            }
        }
        return total
        
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
