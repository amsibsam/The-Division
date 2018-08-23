//
//  MissionEntity+CoreDataProperties.swift
//  The Division
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


extension MissionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MissionEntity> {
        return NSFetchRequest<MissionEntity>(entityName: "MissionEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var missionDescription: String
    @NSManaged public var name: String
    @NSManaged public var state: String
    @NSManaged public var dueDate: NSDate
    @NSManaged public var pic: MemberEntity?
    @NSManaged public var objective: NSSet

}

// MARK: Generated accessors for objective
extension MissionEntity {

    @objc(addObjectiveObject:)
    @NSManaged public func addToObjective(_ value: ObjectiveEntity)

    @objc(removeObjectiveObject:)
    @NSManaged public func removeFromObjective(_ value: ObjectiveEntity)

    @objc(addObjective:)
    @NSManaged public func addToObjective(_ values: NSSet)

    @objc(removeObjective:)
    @NSManaged public func removeFromObjective(_ values: NSSet)

}
