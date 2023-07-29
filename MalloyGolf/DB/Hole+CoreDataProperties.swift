//
//  Hole+CoreDataProperties.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//
//

import Foundation
import CoreData


extension Hole {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hole> {
        return NSFetchRequest<Hole>(entityName: "Hole")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var number: Int16
    @NSManaged public var p1Score: Int16
    @NSManaged public var p2Score: Int16
    @NSManaged public var p3Score: Int16
    @NSManaged public var p4Score: Int16
    @NSManaged public var par: Int16
    @NSManaged public var game: Game?

}

extension Hole : Identifiable {

}
