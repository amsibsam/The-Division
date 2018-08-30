//
//  PartnerCoreData.swift
//  The Division
//
//  Created by MTMAC16 on 30/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData

class PartnerCoreData: BaseCoreData {
    static let shared: PartnerCoreData = PartnerCoreData()
    
    func getAllAgent(completion: @escaping ([Member]) -> Void) {
        TeamCoreData.shared.getMember { (member) in
            if let allMember = member {
                completion(allMember)
            }
        }
    }
    
    func getPartner(on mission: Mission, completion: @escaping ([Member]) -> Void) {
        doBackgroundTask { (context) in
            do {
                let req = MemberEntity.fetchRequest() as NSFetchRequest
                req.predicate = NSPredicate(format: "ANY sideMission.id = %@", mission.id)
                
                let result = try context.fetch(req)
                
                let partner = result.map({ (memberEntity) -> Member in
                    return Member(id: memberEntity.id, name: memberEntity.name, division: TeamDivision(rawValue: memberEntity.division)!, missionCount: 0, avatarURL: nil, pict: memberEntity.pict)
                })
                
                DispatchQueue.main.async {
                    completion(partner)
                }
            } catch let error as NSError {
                print("cant get partner on mission \(error), \(error.userInfo)")
            }
            
        }
    }
    
    func addPartner(on mission: Mission, with partner: Member, completion: @escaping (Member) -> Void) {
        doBackgroundTask { (context) in
            do {
                let reqMember = MemberEntity.fetchRequest() as NSFetchRequest
                reqMember.predicate = NSPredicate(format: "id = %@", partner.id)
                
                let memberEntity = try context.fetch(reqMember)
                
                let reqMission = MissionEntity.fetchRequest() as NSFetchRequest
                reqMission.predicate = NSPredicate(format: "id = %@", mission.id)
                
                let missionEntity = try context.fetch(reqMission)
                
                if let sideMission = missionEntity.first {
                    memberEntity.first?.addToSideMission(sideMission)
                    try context.save()
                    
                    DispatchQueue.main.async {
                        completion(partner)
                    }
                }
                
            } catch let error as NSError {
                print("cant add partner on mission \(error), \(error.userInfo)")
            }
        }
    }
}
