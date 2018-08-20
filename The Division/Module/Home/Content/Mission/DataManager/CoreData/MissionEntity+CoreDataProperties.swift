//
//  MissionEntity+CoreDataProperties.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


extension MissionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MissionEntity> {
        return NSFetchRequest<MissionEntity>(entityName: "MissionEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var missionDescription: String?
    @NSManaged public var state: String?

}
