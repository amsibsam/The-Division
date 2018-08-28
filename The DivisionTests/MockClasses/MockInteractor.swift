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
    
    var callbackResult = [String: AnyObject]()
    
    func login(email: String, password: String) {
        dataManager?.login(email: email, password: password)
    }
    
    func showLoginSucceeded() {
        presenter?.showLoginSucceeded()
        callbackResult["showLoginSucceeded"] = "" as AnyObject
    }
    
    func showError(with message: String) {
        presenter?.showError(with: message)
        callbackResult["showError"] = message as AnyObject
    }
    
}

class MockHomeContainerInteractor: HomeContainerInteractorInputProtocol, HomeContainerDataManagerOutputProtocol {
    var presenter: HomeContainerInteractorOutputProtocol?
    
    var dataManager: HomeContainerDataManagerInputProtocol?
    
    var callbackResult = [String: AnyObject]()
    
    func getMenuItem() {
        dataManager?.getMenuItem()
    }
    
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        presenter?.onGetMenuItemSucceed(menuItems: menuItems)
        callbackResult["onGetMenuItemSucceed"] = menuItems as AnyObject
    }
}

class MockMissionInteractor: MissionInteractorInputProtocol, MissionDataManagerOutputProtocol {
    var presenter: MissionInteractorOutputProtocol?
    
    var dataManager: MissionDataManagerInputProtocol?
    
    var callbackResult = [String: AnyObject]()
    
    func editMission(with mission: Mission) {
        dataManager?.editMission(with: mission)
    }
    
    func getMission(with state: MissionState) {
        dataManager?.getMission(with: state)
    }
    
    func createMission(with name: String, description: String, assignee: Member, objective: [Objective]) {
        dataManager?.createMission(with: name, description: description, assignee: assignee, objective: objective)
    }
    
    func getAllAgent() {
        dataManager?.getAllAgent()
    }
    
    func onGetMissionSucceeded(with missions: [Mission]) {
        presenter?.onGetMissionSucceeded(with: missions)
        callbackResult["onGetMissionSucceeded"] = missions as AnyObject
    }
    
    func onCreateMissionSucceeded(with mission: Mission) {
        presenter?.onCreateMissionSucceeded(with: mission)
        callbackResult["onCreateMissionSucceeded"] = mission as AnyObject
    }
    
    func onGetAllAgentSucceeded(with agents: [Member]) {
        presenter?.onGetAllAgentSuceeded(with: agents)
        callbackResult["onGetAllAgentSucceeded"] = agents as AnyObject
    }
}
