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
    
    func add(mission: Mission, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let missionEntity = MissionEntity(entity: MissionEntity.entity(), insertInto: self.managedContext)
                missionEntity.id = mission.id
                missionEntity.name = mission.name
                missionEntity.missionDescription = mission.description
                missionEntity.state = mission.state.rawValue
                
                if let assignee = mission.assignee {
                    let req = MemberEntity.fetchRequest() as NSFetchRequest
                    req.predicate = NSPredicate(format: "id = %@", assignee.id)
                    let result = try self.managedContext.fetch(req)
                    missionEntity.pic = result.first
                }
                
                self.save()
                DispatchQueue.main.async {
                    completion(true)
                }
            } catch let error as NSError {
                print("error get member \(error), \(error.userInfo)")
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
    
    func addOrUpdate(mission: Mission, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let missionEntity = self.getMissionEntity(by: mission) {
                missionEntity.name = mission.name
                missionEntity.missionDescription = mission.description
                missionEntity.state = mission.state.rawValue
                self.save()
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                self.add(mission: mission, completion: completion)
            }
        }
    }
    
    func getMission(by mission: Mission, completion: @escaping (Mission?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fetchRequest = MissionEntity.fetchRequest() as NSFetchRequest
                fetchRequest.predicate = NSPredicate(format: "id = %@", mission.id)
                let filteredEntity = try self.managedContext.fetch(fetchRequest)
                
                if let filterEntityResult = filteredEntity.first {
                    var mission = Mission(id: filterEntityResult.id, name: filterEntityResult.name, description: filterEntityResult.missionDescription , state: MissionState(rawValue: filterEntityResult.state)!)
                    
                    if let pic = filterEntityResult.pic {
                        mission.assignee = Member(id: pic.id, name: pic.name, division: TeamDivision(rawValue: pic.division)!, missionCount: 0, avatarURL: nil, pict: pic.pict)
                    }
                    
                    DispatchQueue.main.async {
                        completion(mission)
                    }
                }
                
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch let error as NSError {
                print("error fetch \(error), \(error.userInfo)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    func getMission(byState: MissionState, completion: @escaping ([Mission]?) -> Void){
        DispatchQueue.global(qos: .background).async {
            do {
                let request = MissionEntity.fetchRequest() as NSFetchRequest
                request.predicate = NSPredicate(format: "state = %@", byState.rawValue)
                
                let filteredEntity: [MissionEntity] = try self.managedContext.fetch(request)
                
                let filteredMission: [Mission] = filteredEntity.map { (missionEntity) -> Mission in
                    var mission = Mission(id: missionEntity.id, name: missionEntity.name, description: missionEntity.missionDescription , state: MissionState(rawValue: missionEntity.state)!)
                    
                    if let pic = missionEntity.pic {
                        mission.assignee = Member(id: pic.id, name: pic.name, division: TeamDivision(rawValue: pic.division)!, missionCount: 0, avatarURL: nil, pict: pic.pict)
                    }
                    
                    return mission
                }
                
                DispatchQueue.main.async {
                    completion(filteredMission)
                }
            } catch let error as NSError {
                print("error fetch \(error), \(error.userInfo)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    func getMission(completion: @escaping ([Mission]?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let missionEntities: [MissionEntity] = try self.managedContext.fetch(MissionEntity.fetchRequest())
                let result: [Mission] = missionEntities.map({ (missionEntity) -> Mission in
                    var mission = Mission(id: missionEntity.id, name: missionEntity.name, description: missionEntity.missionDescription , state: MissionState(rawValue: missionEntity.state)!)
                    
                    if let pic = missionEntity.pic {
                        mission.assignee = Member(id: pic.id, name: pic.name, division: TeamDivision(rawValue: pic.division)!, missionCount: 0, avatarURL: nil, pict: pic.pict)
                    }
                    
                    return mission
                })
                
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
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
