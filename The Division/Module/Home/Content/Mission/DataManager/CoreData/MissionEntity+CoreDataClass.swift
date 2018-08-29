//
//  MissionEntity+CoreDataClass.swift
//  The Division
//
//  Created by MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//

import Foundation
import CoreData


public class MissionEntity: NSManagedObject {
    var progress: Double {
        do {
            let req = ObjectiveEntity.fetchRequest() as NSFetchRequest
            req.predicate = NSPredicate(format: "mission.id = %@", self.id)
            
            guard let objective = try managedObjectContext?.fetch(req) else { return 0 }
            let completedObjective = objective.filter { (objectiveEntity) -> Bool in
                return objectiveEntity.isComplete
            }
            
            return ((Double(completedObjective.count) / Double(objective.count)) * 100)
            
        } catch let error as NSError {
            print("failed get Objective count \(error), \(error.userInfo)")
        }
        return 0
    }
}
