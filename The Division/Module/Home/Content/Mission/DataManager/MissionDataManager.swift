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
        MissionCoreData.shared.add(mission: mission) { missions in
            self.interactor?.onCreateMissionSucceeded(with: mission)
        }
        
    }
    
    func getMission(with state: MissionState) {
        MissionCoreData.shared.getMission(byState: state) { missions in
            if let result = missions {
                self.interactor?.onGetMissionSucceeded(with: result)
            }
        }
    }
    
    func editMission(with mission: Mission) {
        MissionCoreData.shared.addOrUpdate(mission: mission) { _ in
            
        }
    }
    
    func getAllAgent() {
        TeamCoreData.shared.getMember() { members in
            if let agents = members {
                self.interactor?.onGetAllAgentSucceeded(with: agents)
            }
        }
    }
}
