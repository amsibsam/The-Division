//
//  MissionPresenter.swift
//  The Division
//
//  Created MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionPresenter: MissionPresenterProtocol {
  
    weak private var view: MissionViewProtocol?
    var interactor: MissionInteractorInputProtocol?
    private let router: MissionWireframeProtocol

    init(interface: MissionViewProtocol, interactor: MissionInteractorInputProtocol?, router: MissionWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func createMission(with name: String, description: String, assignee: Member) {
        interactor?.createMission(with: name, description: description, assignee: assignee)
    }
    
    func getMission(with state: MissionState) {
        interactor?.getMission(with: state)
    }

    func editMission(with mission: Mission) {
        interactor?.editMission(with: mission)
    }
    
    func openMissionDetail(from view: MissionViewProtocol, with mission: Mission) {
        router.openMissionDetail(from: view, with: mission)
    }
    
    func getAllAgent() {
        interactor?.getAllAgent()
    }

}

extension MissionPresenter: MissionInteractorOutputProtocol {
    func onCreateMissionSucceeded(with mission: Mission) {
        view?.onCreateMissionSucceeded(with: mission)
    }
    
    func onGetMissionSucceeded(with missions: [Mission]) {
        view?.onGetMissionSucceeded(with: missions      )
    }
    
    func onGetAllAgentSuceeded(with agents: [Member]) {
        view?.onGetAllAgentSucceed(with: agents)
    }
}
