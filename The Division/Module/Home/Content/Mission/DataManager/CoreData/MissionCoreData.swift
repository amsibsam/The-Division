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
    
    override private init() { }
    
    func add(mission: Mission) {
        let missionEntity = MissionEntity(entity: MissionEntity.entity(), insertInto: managedContext)
        missionEntity.id = mission.id
        missionEntity.name = mission.name
        missionEntity.missionDescription = mission.description
        missionEntity.state = mission.state.rawValue
//        missionEntity.pic = TeamCoreData.shared.
        
        save()
    }
    
    func addOrUpdate(mission: Mission) {
        if let missionEntity = getMissionEntity(by: mission) {
            missionEntity.name = mission.name
            missionEntity.missionDescription = mission.description
            missionEntity.state = mission.state.rawValue
            save()
        } else {
            add(mission: mission)
        }
    }
    
    func getMission(by mission: Mission) -> Mission? {
        do {
            let fetchRequest = MissionEntity.fetchRequest() as NSFetchRequest
            fetchRequest.predicate = NSPredicate(format: "id = %@", mission.id)
            let filteredEntity = try managedContext.fetch(fetchRequest)
            
            if let filterEntityResult = filteredEntity.first {
                let result: Mission = Mission(id: filterEntityResult.id, name: filterEntityResult.name, description: filterEntityResult.description, state: MissionState(rawValue: filterEntityResult.state)!)
                
                return result
            }
            
            return nil
        } catch let error as NSError {
            print("error fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getMission(byState: MissionState) -> [Mission]? {
        do {
            let request = MissionEntity.fetchRequest() as NSFetchRequest
            request.predicate = NSPredicate(format: "state = %@", byState.rawValue)
            
            let filteredEntity: [MissionEntity] = try managedContext.fetch(request)
            
            let filteredMission: [Mission] = filteredEntity.map { (missionEntity) -> Mission in
                return Mission(id: missionEntity.id, name: missionEntity.name, description: missionEntity.missionDescription ?? "", state: MissionState(rawValue: missionEntity.state)!)
            }

            return filteredMission
        } catch let error as NSError {
            print("error fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getMission() -> [Mission]? {
        do {
            let missionEntities: [MissionEntity] = try managedContext.fetch(MissionEntity.fetchRequest())
            let result: [Mission] = missionEntities.map({ (missionEntity) -> Mission in
                return Mission(id: missionEntity.id, name: missionEntity.name, description: missionEntity.missionDescription ?? "", state: MissionState(rawValue: missionEntity.state)!)
            })
            
            return result
        } catch {
            return nil
        }
    }
    
    private func getMissionEntity(by mission: Mission) -> MissionEntity? {
        do {
            let fetchRequest = MissionEntity.fetchRequest() as NSFetchRequest
            fetchRequest.predicate = NSPredicate(format: "id = %@", mission.id)
            let filteredEntity = try managedContext.fetch(fetchRequest)
            
            if let filterEntityResult = filteredEntity.first {
                return filterEntityResult
            }
            
            return nil
        } catch let error as NSError {
            print("error fetch \(error), \(error.userInfo)")
            return nil
        }
    }
}
