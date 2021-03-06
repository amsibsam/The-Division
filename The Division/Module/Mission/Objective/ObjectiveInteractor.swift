//
//  ObjectiveInteractor.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ObjectiveInteractor: ObjectiveInteractorInputProtocol {

    var dataManager: ObjectiveDataManagerInputProtocol?
    weak var presenter: ObjectiveInteractorOutputProtocol?
    
    func updateObjectives(with objectives: [Objective]) {
        dataManager?.updateObjectives(with: objectives)
    }
    
    func saveObjective(with objective: Objective) {
        dataManager?.saveObjective(with: objective)
    }
    
    func addOrUpdate(with objective: Objective) {
        dataManager?.addOrUpdate(with: objective)
    }
    
    func getObjective(on mission: Mission) {
        dataManager?.getObjective(on: mission)
    }
}

extension ObjectiveInteractor: ObjectiveDataManagerOutputProtocol {
    func onGetObjectiveSucceeded(with objectives: [Objective]) {
        presenter?.onGetObjectiveSucceeded(with: objectives)
    }
    
    func onSaveObjectiveSucceeded(with objective: Objective) {
        presenter?.onSaveObjectiveSucceeded(with: objective)
    }
    
    func onAddOrUpdateSucceeded(with objective: Objective) {
        presenter?.onAddOrUpdateSucceeded(with: objective)
    }
    
    
}
