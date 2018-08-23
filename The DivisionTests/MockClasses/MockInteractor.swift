//
//  MockLoginInteractor.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockLoginInteractor: LoginInteractorInputProtocol, LoginDataManagerOutputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    var dataManager: LoginDataManagerInputProtocol?
    
    func login(email: String, password: String) {
        dataManager?.login(email: email, password: password)
    }
    
    func showLoginSucceeded() {
        presenter?.showLoginSucceeded()
    }
    
    func showError(with message: String) {
        presenter?.showError(with: message)
    }
    
}

class MockHomeContainerInteractor: HomeContainerInteractorInputProtocol, HomeContainerDataManagerOutputProtocol {
    var presenter: HomeContainerInteractorOutputProtocol?
    
    var dataManager: HomeContainerDataManagerInputProtocol?
    
    func getMenuItem() {
        dataManager?.getMenuItem()
    }
    
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        presenter?.onGetMenuItemSucceed(menuItems: menuItems)
    }
}

class MockMissionInteractor: MissionInteractorInputProtocol, MissionDataManagerOutputProtocol {
    var presenter: MissionInteractorOutputProtocol?
    
    var dataManager: MissionDataManagerInputProtocol?
    
    func editMission(with mission: Mission) {
        dataManager?.editMission(with: mission)
    }
    
    func getMission(with state: MissionState) {
        dataManager?.getMission(with: state)
    }
    
    func createMission(with name: String, description: String, assignee: Member) {
        dataManager?.createMission(with: name, description: description, assignee: assignee)
    }
    
    func getAllAgent() {
        dataManager?.getAllAgent()
    }
    
    func onGetMissionSucceeded(with missions: [Mission]) {
        presenter?.onGetMissionSucceeded(with: missions)
    }
    
    func onCreateMissionSucceeded(with mission: Mission) {
        presenter?.onCreateMissionSucceeded(with: mission)
    }
    
    func onGetAllAgentSucceeded(with agents: [Member]) {
        presenter?.onGetAllAgentSuceeded(with: agents)
    }
}
