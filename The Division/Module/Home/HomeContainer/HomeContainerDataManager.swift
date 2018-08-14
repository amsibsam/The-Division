//
//  HomeContainerDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class HomeContainerDataManager: HomeContainerDataManagerInputProtocol {
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
