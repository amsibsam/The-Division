//
//  MissionEntity+CoreDataProperties.swift
//  The Division
//
//  Created by MTMAC16 on 30/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


extension MissionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MissionEntity> {
        return NSFetchRequest<MissionEntity>(entityName: "MissionEntity")
    }

    @NSManaged public var dueDate: NSDate?
    @NSManaged public var id: String
    @NSManaged public var missionDescription: String
    @NSManaged public var name: String
    @NSManaged public var state: String
    @NSManaged public var pic: MemberEntity?
    @NSManaged public var objective: NSSet?
    @NSManaged public var picPartner: NSSet?

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

// MARK: Generated accessors for picPartner
extension MissionEntity {

    @objc(addPicPartnerObject:)
    @NSManaged public func addToPicPartner(_ value: MemberEntity)

    @objc(removePicPartnerObject:)
    @NSManaged public func removeFromPicPartner(_ value: MemberEntity)

    @objc(addPicPartner:)
    @NSManaged public func addToPicPartner(_ values: NSSet)

    @objc(removePicPartner:)
    @NSManaged public func removeFromPicPartner(_ values: NSSet)

}
