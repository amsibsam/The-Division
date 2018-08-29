//
//  ObjectivePresenter.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ObjectivePresenter: ObjectivePresenterProtocol {

    weak private var view: ObjectiveViewProtocol?
    var interactor: ObjectiveInteractorInputProtocol?
    private let router: ObjectiveWireframeProtocol

    init(interface: ObjectiveViewProtocol, interactor: ObjectiveInteractorInputProtocol?, router: ObjectiveWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func saveObjective(with title: String) {
        interactor?.saveObjective(with: Objective(id: "\(Date().timeIntervalSince1970)", name: title))
    }
    
    func getObjective(on mission: Mission) {
        interactor?.getObjective(on: mission)
    }
    
    func updateObjectives(with objectives: [Objective]) {
        interactor?.updateObjectives(with: objectives)
    }
    
}

extension ObjectivePresenter: ObjectiveInteractorOutputProtocol {
    func onGetObjectiveSucceeded(with objectives: [Objective]) {
        view?.onGetObjectiveSucceeded(with: objectives)
    }
    
    func onAddOrUpdateSucceeded(with objective: Objective) {
        view?.onSucceedUpdateObjective()
    }
    
    func onSaveObjectiveSucceeded(with objective: Objective) {
        view?.onSaveObjectiveSucceeded(with: objective)
    }
}
