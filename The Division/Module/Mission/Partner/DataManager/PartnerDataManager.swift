//
//  PartnerDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 30/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class PartnerDataManager: PartnerDataManagerInputProtocol {

    var interactor: PartnerDataManagerOutputProtocol?
    
    func getAllAgent() {
        PartnerCoreData.shared.getAllAgent { (member) in
            self.interactor?.onGetAllAgentSucceeded(with: member)
        }
    }
    
    func getPartner(on mission: Mission) {
        PartnerCoreData.shared.getPartner(on: mission) { (partners) in
            self.interactor?.onGetPartnerSucceeded(with: partners)
        }
    }
    
    func addPartner(on mission: Mission, with partner: Member) {
        PartnerCoreData.shared.addPartner(on: mission, with: partner) { (partner) in
            self.interactor?.onAddPartnerSucceeded(with: partner)
        }
    }
    
    
}
