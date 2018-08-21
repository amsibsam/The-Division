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
        if let members = TeamCoreData.shared.getMember(on: team) {
            interactor?.onGetMemberSucceeded(with: members)
        }
    }
    
    func addMember(with member: Member) {
        TeamCoreData.shared.add(member: member)
        interactor?.onSuccessAddMember(with: member)
    }
}
