//
//  MissionDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class MissionDataManager: MissionDataManagerInputProtocol {
    var interactor: MissionDataManagerOutputProtocol?
    
    func getMission(with state: MissionState) {
        interactor?.onGetMissionSucceeded(with: [])
    }
    
    private func generateInProgressMission() {
        var missions: [Mission] = []
        
        missions.append(Mission(name: "Misi 10001", description: "Ini dia deskripsinya"))
    }
    
    private func generateFinishedMission() {
        
    }
    
}
