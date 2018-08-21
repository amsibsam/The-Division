//
//  TeamPresenter.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class TeamPresenter: TeamPresenterProtocol {
    weak private var view: TeamViewProtocol?
    var interactor: TeamInteractorInputProtocol?
    private let router: TeamWireframeProtocol

    init(interface: TeamViewProtocol, interactor: TeamInteractorInputProtocol?, router: TeamWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getTeamMember(on team: TeamDivision) {
        interactor?.getTeamMember(on: team)
    }
    
    func addMember(with name: String, on team: TeamDivision, avatarUrl: String?) {
        let member = Member(id: "\(NSDate().timeIntervalSince1970)", name: name, division: team, missionCount: 0, avatarURL: URL(string: avatarUrl ?? "http://"))
        interactor?.addMember(with: member)
    }
    
    func presentCreateTeamPopup(from view: TeamViewProtocol, completion: @escaping (String, TeamDivision, Data?) -> ()) {
        router.presentCreateTeamPopup(from: view, completion: completion)
    }
}

extension TeamPresenter: TeamInteractorOutputProtocol {
    func onSuccessAddMember(with member: Member) {
        view?.onSuccessAddMember(with: member)
    }
    
    func onGetMemberSucceeded(with members: [Member]) {
        view?.onGetMemberSucceeded(with: members)
    }
    
    
}
