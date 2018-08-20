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
        let mission = Mission(name: name, description: description, state: .New)
        if let savedMission = MissionCoreData.shared.save(mission: mission) {
            interactor?.onCreateMissionSucceeded(with: savedMission)
        }
    }
    
    func getMission(with state: MissionState) {
        if let mission = MissionCoreData.shared.getMission() {
            interactor?.onGetMissionSucceeded(with: mission)
        }
    }
    
}
