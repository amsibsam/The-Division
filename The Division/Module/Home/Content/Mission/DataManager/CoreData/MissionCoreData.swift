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
    private let MISSION_STATE = "state"
    
    func save(mission: Mission) -> Mission? {
        let missionEntity = MissionEntity(entity: MissionEntity.entity(), insertInto: managedContext)
        missionEntity.name = mission.name
        missionEntity.missionDescription = mission.description
        missionEntity.state = mission.state.rawValue
        
        do {
            try managedContext.save()
            let mission = Mission(name: missionEntity.value(forKey: MISSION_NAME) as! String,
                                  description: missionEntity.value(forKey: MISSION_DESCRIPTION) as! String,
                                  state: MissionState(rawValue: missionEntity.value(forKey: MISSION_STATE) as! String)!)
            return mission
        } catch let error as NSError {
            print("failed to save entity \(error)")
            return nil
        }
    }
    
    func getMission() -> [Mission]? {
        do {
            let missionEntities: [MissionEntity] = try managedContext.fetch(MissionEntity.fetchRequest())
            let result: [Mission] = missionEntities.map({ (missionEntity) -> Mission in
                return Mission(name: missionEntity.name, description: missionEntity.description, state: MissionState(rawValue: missionEntity.state!)!)
            })
            
            return result
        } catch {
            return nil
        }
        
        
        return nil
        
//        let missionEntity = fetch(entityName: String(describing: MissionEntity.self))
//        guard let result: [Mission] = missionEntity?.map({ (missionEntity) -> Mission in
//            return Mission(name: missionEntity.value(forKey: MISSION_NAME) as! String,
//                           description: missionEntity.value(forKey: MISSION_DESCRIPTION) as! String,
//                           state: MissionState(rawValue: missionEntity.value(forKey: MISSION_STATE) as! String) ?? .New)
//        }) else { return nil }
//
//        return result
    }
}
