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
        let mission = Mission(id: "\(NSDate().timeIntervalSince1970)", name: name, description: description, state: .New)
        MissionCoreData.shared.add(mission: mission)
        interactor?.onCreateMissionSucceeded(with: mission)
    }
    
    func getMission(with state: MissionState) {
        if let mission = MissionCoreData.shared.getMission() {
            interactor?.onGetMissionSucceeded(with: mission)
        }
    }
    
    func editMission(with mission: Mission) {
        MissionCoreData.shared.addOrUpdate(mission: mission)
    }
}
