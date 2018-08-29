//
//  MissionDetailDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 29/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class MissionDetailDataManager: MissionDetailDataManagerInputProtocol {
    var interactor: MissionDetailDataManagerOutputProtocol?
    
    func getUpdatedMission(from mission: Mission) {
        MissionCoreData.shared.getMission(by: mission) { (mission) in
            self.interactor?.onGetUpdatedMission(with: mission)
        }
    }
    
    
}
