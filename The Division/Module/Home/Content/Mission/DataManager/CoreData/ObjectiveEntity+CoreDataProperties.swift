//
//  ObjectiveEntity+CoreDataProperties.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


extension ObjectiveEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ObjectiveEntity> {
        return NSFetchRequest<ObjectiveEntity>(entityName: "ObjectiveEntity")
    }

    @NSManaged public var isComplete: Bool
    @NSManaged public var objective: String
    @NSManaged public var mission: MissionEntity?

}
