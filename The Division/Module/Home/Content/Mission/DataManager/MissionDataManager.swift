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
    
    func createMission(with name: String, description: String, assignee: Member) {
        var mission = Mission(id: "\(NSDate().timeIntervalSince1970)", name: name, description: description, state: .New)
        mission.assignee = assignee
        MissionCoreData.shared.add(mission: mission)
        interactor?.onCreateMissionSucceeded(with: mission)
    }
    
    func getMission(with state: MissionState) {
        if let mission = MissionCoreData.shared.getMission(byState: state) {
            interactor?.onGetMissionSucceeded(with: mission)
        }
    }
    
    func editMission(with mission: Mission) {
        MissionCoreData.shared.addOrUpdate(mission: mission)
    }
    
    func getAllAgent() {
        if let agents = TeamCoreData.shared.getMember() {
            interactor?.onGetAllAgentSucceeded(with: agents)
        }
    }
}
