//
//  MissionDetailInteractor.swift
//  The Division
//
//  Created MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionDetailInteractor: MissionDetailInteractorInputProtocol {
    var dataManager: MissionDetailDataManagerInputProtocol?
    
    weak var presenter: MissionDetailInteractorOutputProtocol?
    
    func getUpdatedMission(from mission: Mission) {
        dataManager?.getUpdatedMission(from: mission)
    }
    
}

extension MissionDetailInteractor: MissionDetailDataManagerOutputProtocol {
    func onGetUpdatedMission(with mission: Mission?) {
        presenter?.onGetUpdatedMission(with: mission)
    }
}
