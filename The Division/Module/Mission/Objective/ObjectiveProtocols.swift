//
//  ObjectiveProtocols.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol ObjectiveWireframeProtocol: class {

}
//MARK: Presenter -
protocol ObjectivePresenterProtocol: class {

    var interactor: ObjectiveInteractorInputProtocol? { get set }
    
    /* ViewController -> Presenter */
    func saveObjective(with title: String)
    func getObjective(on mission: Mission)
    func updateObjectives(with objectives: [Objective])
}

//MARK: Interactor -
protocol ObjectiveInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func onSaveObjectiveSucceeded(with objective: Objective)
    func onAddOrUpdateSucceeded(with objective: Objective)
    func onGetObjectiveSucceeded(with objectives: [Objective])
}

protocol ObjectiveInteractorInputProtocol: class {

    var presenter: ObjectiveInteractorOutputProtocol?  { get set }
    var dataManager: ObjectiveDataManagerInputProtocol? { get set }

    /* Presenter -> Interactor */
    func saveObjective(with objective: Objective)
    func getObjective(on mission: Mission)
    func updateObjectives(with objectives: [Objective])
}

//MARK: View -
protocol ObjectiveViewProtocol: class {

    var presenter: ObjectivePresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func onSaveObjectiveSucceeded(with objective: Objective)
    func onGetObjectiveSucceeded(with objectives: [Objective])
}

//MARK: DataManager -
protocol ObjectiveDataManagerInputProtocol: class {
    var interactor: ObjectiveDataManagerOutputProtocol? { get set }
    
    /* Interactor -> DataManager */
    func saveObjective(with objective: Objective)
    func addOrUpdate(with objective: Objective)
    func getObjective(on mission: Mission)
    func updateObjectives(with objectives: [Objective])
}

protocol ObjectiveDataManagerOutputProtocol: class {
    /* DataManager -> Interactor */
    func onSaveObjectiveSucceeded(with objective: Objective)
    func onAddOrUpdateSucceeded(with objective: Objective)
    func onGetObjectiveSucceeded(with objectives: [Objective])
}
