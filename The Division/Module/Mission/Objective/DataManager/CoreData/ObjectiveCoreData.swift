//
//  ObjectiveCoreData.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData

class ObjectiveCoreData: BaseCoreData {
    static let shared: ObjectiveCoreData = ObjectiveCoreData()
    
    func saveObjective(with objective: Objective, completion: @escaping (Objective) -> Void) {
        doBackgroundTask { (context) in
            do {
                let objectiveEntity = ObjectiveEntity.init(entity: ObjectiveEntity.entity(), insertInto: context)
                objectiveEntity.id = objective.id
                objectiveEntity.isComplete = false
                objectiveEntity.objective = objective.name
                try context.save()
                DispatchQueue.main.async {
                    completion(objective)
                }
            } catch let error as NSError {
                print("failed to save objective \(error), \(error.userInfo)")
            }
        }
    }
    
    func getObjective(on mission: Mission, completion: @escaping ([Objective]) -> Void) {
        doBackgroundTask { (context) in
            do {
                let req = ObjectiveEntity.fetchRequest() as NSFetchRequest
                req.predicate = NSPredicate(format: "mission.id = %@", mission.id)
                
                let objectivesResult = try context.fetch(req)
                let objectives = objectivesResult.map({ (objectiveEntity) -> Objective in
                    print("isComplete \(objectiveEntity.isComplete)")
                    var objective = Objective(id: objectiveEntity.id, name: objectiveEntity.objective)
                    objective.isComplete = objectiveEntity.isComplete
                    return objective
                })
                
                completion(objectives)
            } catch let error as NSError {
                print("failed get objective on mission \(error), \(error.userInfo)")
            }
        }
    }
    
    func addOrUpdate(with objective: Objective, completion: @escaping (Objective) -> Void) {
        doBackgroundTask { (context) in
            do{
                if let objectiveEntity = self.getObjectiveEntity(by: objective, context: context) {
                    objectiveEntity.isComplete = objective.isComplete
                    objectiveEntity.objective = objective.name
                    
                    try context.save()
                    
                    DispatchQueue.main.async {
                        completion(objective)
                    }
                } else {
                    self.saveObjective(with: objective, completion: { (objective) in
                        DispatchQueue.main.async {
                            completion(objective)
                        }
                    })
                }
            } catch let error as NSError {
                print("failed to insert or update objective \(error), \(error.userInfo)")
            }
        }
    }
    
    func update(with objective: Objective) {
        doBackgroundTask { (context) in
            do{
                if let objectiveEntity = self.getObjectiveEntity(by: objective, context: context) {
                    objectiveEntity.isComplete = objective.isComplete
                    objectiveEntity.objective = objective.name
                    
                    print("updated \(objectiveEntity.objective) \(objectiveEntity.isComplete)")
                    
                    try context.save()
                }
            } catch let error as NSError {
                print("failed to insert or update objective \(error), \(error.userInfo)")
            }
        }
    }
    
    private func getObjectiveEntity(by objective: Objective, context: NSManagedObjectContext) -> ObjectiveEntity? {
        
        do {
            let req = ObjectiveEntity.fetchRequest() as NSFetchRequest
            req.predicate = NSPredicate(format: "id = %@", objective.id)
            let objectiveEntity = try context.fetch(req)
            
            return objectiveEntity.first
        } catch let error as NSError {
            print("failed to get objectiveEntity by id \(error), \(error.userInfo)")
            return nil
        }
        
    }
}
