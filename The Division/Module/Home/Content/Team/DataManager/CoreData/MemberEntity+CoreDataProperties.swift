//
//  MemberEntity+CoreDataProperties.swift
//  The Division
//
//  Created by MTMAC16 on 30/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


extension MemberEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberEntity> {
        return NSFetchRequest<MemberEntity>(entityName: "MemberEntity")
    }

    @NSManaged public var avatarUrl: String?
    @NSManaged public var division: String
    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var pictData: NSData?
    @NSManaged public var assignedMission: NSSet?
    @NSManaged public var sideMission: NSSet?

}

// MARK: Generated accessors for assignedMission
extension MemberEntity {

    @objc(addAssignedMissionObject:)
    @NSManaged public func addToAssignedMission(_ value: MissionEntity)

    @objc(removeAssignedMissionObject:)
    @NSManaged public func removeFromAssignedMission(_ value: MissionEntity)

    @objc(addAssignedMission:)
    @NSManaged public func addToAssignedMission(_ values: NSSet)

    @objc(removeAssignedMission:)
    @NSManaged public func removeFromAssignedMission(_ values: NSSet)

}

// MARK: Generated accessors for sideMission
extension MemberEntity {

    @objc(addSideMissionObject:)
    @NSManaged public func addToSideMission(_ value: MissionEntity)

    @objc(removeSideMissionObject:)
    @NSManaged public func removeFromSideMission(_ value: MissionEntity)

    @objc(addSideMission:)
    @NSManaged public func addToSideMission(_ values: NSSet)

    @objc(removeSideMission:)
    @NSManaged public func removeFromSideMission(_ values: NSSet)

}
