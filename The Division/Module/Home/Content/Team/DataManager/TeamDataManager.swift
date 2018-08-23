//
//  TeamDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class TeamDataManager: TeamDataManagerInputProtocol {
    var interactor: TeamDataManagerOutputProtocol?
    
    func getTeamMember(on team: TeamDivision) {
        TeamCoreData.shared.getMember(on: team) { (members) in
            if let results = members {
                self.interactor?.onGetMemberSucceeded(with: results)
            }
        }
    }
    
    func addMember(with member: Member) {
        TeamCoreData.shared.add(member: member) { success in
            if success {
                self.interactor?.onSuccessAddMember(with: member)
            }
        }
        
    }
}
