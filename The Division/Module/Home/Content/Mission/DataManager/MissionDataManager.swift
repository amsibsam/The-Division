//
//  MissionDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MissionDataManager: MissionDataManagerInputProtocol {
    var interactor: MissionDataManagerOutputProtocol?
    
    func createMission(with name: String, description: String) {
        let mission = Mission(name: name, description: description)
        if let savedMission = MissionCoreData.shared.save(mission: mission) {
            interactor?.onCreateMissionSucceeded(with: savedMission)
        }
    }
    
    func getMission(with state: MissionState) {
        if let mission = MissionCoreData.shared.getMission() {
            interactor?.onGetMissionSucceeded(with: mission)
        }
        
//        switch state {
//        case .InProgress:
//            interactor?.onGetMissionSucceeded(with: generateInProgressMission())
//        case .Finished:
//            interactor?.onGetMissionSucceeded(with: generateFinishedMission())
//        default:
//            interactor?.onGetMissionSucceeded(with: generateNewMission())
//        }
    }
    
    private func generateNewMission() -> [Mission] {
        var missions: [Mission] = []
        
        missions.append(Mission(name: "Misi 10007", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10008", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10009", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10010", description: "Ini dia deskripsinya"))
        
        return missions
    }
    
    private func generateInProgressMission() -> [Mission] {
        var missions: [Mission] = []
        
        missions.append(Mission(name: "Misi 10005", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10006", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10007", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10008", description: "Ini dia deskripsinya"))
        
        return missions
    }
    
    private func generateFinishedMission() -> [Mission] {
        var missions: [Mission] = []
        
        missions.append(Mission(name: "Misi 10001", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10002", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10003", description: "Ini dia deskripsinya"))
        missions.append(Mission(name: "Misi 10004", description: "Ini dia deskripsinya"))
        
        return missions
    }
    
}
