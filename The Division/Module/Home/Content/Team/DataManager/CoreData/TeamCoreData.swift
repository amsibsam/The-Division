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
    
    func add(member: Member) {
        let memberEntity = MemberEntity(entity: MemberEntity.entity(), insertInto: managedContext)
        memberEntity.id = member.id
        memberEntity.name = member.name
        memberEntity.division = member.division.rawValue
        if let avatarURL = member.avatarURL {
            memberEntity.avatarUrl = "\(avatarURL)"
        }
        
        save()
    }
    
    func getMember() -> [Member]? {
        do {
            let memberEntities: [MemberEntity] = try managedContext.fetch(MemberEntity.fetchRequest())
            let result = memberEntities.map { (memberEntity) -> Member in
                return Member(id: memberEntity.id, name: memberEntity.name, division: TeamDivision(rawValue: memberEntity.division)!, missionCount: 0, avatarURL: memberEntity.avatarURL)
            }
            
            return result
        } catch let error as NSError {
            print("error get member \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getMember(on team: TeamDivision) -> [Member]? {
        do {
            let request = MemberEntity.fetchRequest() as NSFetchRequest
            request.predicate = NSPredicate(format: "division =[cd] %@", team.rawValue)
            
            let memberEntities: [MemberEntity] = try managedContext.fetch(request)
            let result = memberEntities.map { (memberEntity) -> Member in
                return Member(id: memberEntity.id, name: memberEntity.name, division: TeamDivision(rawValue: memberEntity.division)!, missionCount: 0, avatarURL: memberEntity.avatarURL)
            }
            
            return result
        } catch let error as NSError {
            print("error get member \(error), \(error.userInfo)")
            return nil
        }
    }
}
