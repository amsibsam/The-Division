//
//  MockDataManager.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockLoginDataManager: LoginDataManagerInputProtocol {
    var interactor: LoginDataManagerOutputProtocol?
    
    func login(email: String, password: String) {
        if email == "amsibsam" && password == "123" {
            interactor?.showLoginSucceeded()
        } else {
            interactor?.showError(with: "wrong username or password")
        }
    }
}

class MockHomeContainerDataManager: HomeContainerDataManagerInputProtocol {
    var interactor: HomeContainerDataManagerOutputProtocol?
    
    func getMenuItem() {
        interactor?.onGetMenuItemSucceed(menuItems: generateMenu())
    }
    
    private func generateMenu() -> [[MenuItem]] {
        var menuItems: [[MenuItem]] = []
        var teamMenu: [MenuItem] = []
        var missionMenu: [MenuItem] = []
        
        teamMenu.append(MenuItem(name: "Transportation", count: 7))
        teamMenu.append(MenuItem(name: "Acara", count: 12))
        teamMenu.append(MenuItem(name: "Keamanan", count: 20))
        teamMenu.append(MenuItem(name: "Perlengkapan", count: 9))
        
        missionMenu.append(MenuItem(name: "New", count: 5))
        missionMenu.append(MenuItem(name: "In Progress", count: 3))
        missionMenu.append(MenuItem(name: "Finished", count: 19))
        
        menuItems.append(teamMenu)
        menuItems.append(missionMenu)
        
        return menuItems
    }
}

class MockMissionDataManager: MissionDataManagerInputProtocol {
    var interactor: MissionDataManagerOutputProtocol?
    
    func editMission(with mission: Mission) {
        
    }
    
    func getMission(with state: MissionState) {
        // MARK: to do mocking data here
//        interactor?.onGetMissionSucceeded(with: <#T##[Mission]#>)
    }
    
    func createMission(with name: String, description: String, assignee: Member) {
        // MARK: to do mocking data here
//        interactor?.onCreateMissionSucceeded(with: <#T##Mission#>)
    }
    
    func getAllAgent() {
        // MARK: to do mocking data here
//        interactor?.onGetAllAgentSucceeded(with: <#T##[Member]#>)
    }
    
    
}
