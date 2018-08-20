//
//  MissionCoreData.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MissionCoreData: BaseCoreData {
    static let shared: MissionCoreData = MissionCoreData()
    private let MISSION_NAME = "name"
    private let MISSION_DESCRIPTION = "missionDescription"
    
    func save(mission: Mission) -> Mission? {
        guard let missionEntity = NSManagedObject.with(name: "MissionEntity") else { return nil }
        missionEntity.setValue(mission.name, forKey: MISSION_NAME)
        missionEntity.setValue(mission.description, forKey: MISSION_DESCRIPTION)
        
        do {
            try managedContext.save()
            let mission = Mission(name: missionEntity.value(forKey: MISSION_NAME) as! String,
                                  description: missionEntity.value(forKey: MISSION_DESCRIPTION) as! String)
            return mission
        } catch let error as NSError {
            print("failed to save entity \(error)")
            return nil
        }
    }
    
    func getMission() -> [Mission]? {
        let missionEntity = fetch(entityName: "MissionEntity")
        guard let result: [Mission] = missionEntity?.map({ (missionEntity) -> Mission in
            return Mission(name: missionEntity.value(forKey: MISSION_NAME) as! String,
                           description: missionEntity.value(forKey: MISSION_DESCRIPTION) as! String)
        }) else { return nil }
        
        return result
    }
}
