//
//  ObjectiveDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class ObjectiveDataManager: ObjectiveDataManagerInputProtocol {

    var interactor: ObjectiveDataManagerOutputProtocol?
    
    func updateObjectives(with objectives: [Objective]) {
        for objective in objectives {
            ObjectiveCoreData.shared.update(with: objective)
        }
        interactor?.onAddOrUpdateSucceeded(with: objectives[0])
    }
    
    func saveObjective(with objective: Objective) {
        ObjectiveCoreData.shared.saveObjective(with: objective) { (objective) in
            self.interactor?.onSaveObjectiveSucceeded(with: objective)
        }
    }
    
    func addOrUpdate(with objective: Objective) {
        ObjectiveCoreData.shared.addOrUpdate(with: objective) { (objective) in
            self.interactor?.onAddOrUpdateSucceeded(with: objective)
        }
    }
    
    func getObjective(on mission: Mission) {
        ObjectiveCoreData.shared.getObjective(on: mission) { (objective) in
            self.interactor?.onGetObjectiveSucceeded(with: objective)
        }
    }
    
}
