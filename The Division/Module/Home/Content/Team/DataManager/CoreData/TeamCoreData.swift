//
//  TeamCoreData.swift
//  The Division
//
//  Created by MTMAC16 on 21/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TeamCoreData: BaseCoreData {
    static let shared: TeamCoreData = TeamCoreData()
    
    private override init() {}
    
    func add(member: Member, completion: @escaping (Bool) -> Void) {
        doBackgroundTask { (context) in
            do {
                let memberEntity = MemberEntity(entity: MemberEntity.entity(), insertInto: context)
                memberEntity.id = member.id
                memberEntity.name = member.name
                memberEntity.division = member.division.rawValue
                if let pict = member.pict, let pictData = UIImageJPEGRepresentation(pict, 0.3) {
                    memberEntity.pictData = pictData as NSData?
                }
                
                if let avatarURL = member.avatarURL {
                    memberEntity.avatarUrl = "\(avatarURL)"
                }
                
                try context.save()
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
    
    func getMember(completion: @escaping ([Member]?) -> Void) {
        doBackgroundTask { (context) in
            do {
                let memberEntities: [MemberEntity] = try context.fetch(MemberEntity.fetchRequest())
                let result = memberEntities.map { (memberEntity) -> Member in
                    return Member(id: memberEntity.id, name: memberEntity.name, division: TeamDivision(rawValue: memberEntity.division)!, missionCount: memberEntity.assignedMission?.count ?? 0, avatarURL: memberEntity.avatarURL, pict: memberEntity.pict)
                }
                
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error as NSError {
                print("error get member \(error), \(error.userInfo)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    func getMember(on team: TeamDivision, completion: @escaping ([Member]?) -> Void) {
        doBackgroundTask { (context) in
            do {
                let request = MemberEntity.fetchRequest() as NSFetchRequest
                request.predicate = NSPredicate(format: "division =[cd] %@", team.rawValue)
                
                let memberEntities: [MemberEntity] = try context.fetch(request)
                let result = memberEntities.map { (memberEntity) -> Member in
                    return Member(id: memberEntity.id, name: memberEntity.name, division: TeamDivision(rawValue: memberEntity.division)!, missionCount: memberEntity.assignedMission?.count ?? 0, avatarURL: memberEntity.avatarURL, pict: memberEntity.pict)
                }
                
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error as NSError {
                print("error get member \(error), \(error.userInfo)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
