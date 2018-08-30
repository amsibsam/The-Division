//
//  MissionDetailPresenter.swift
//  The Division
//
//  Created MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionDetailPresenter: MissionDetailPresenterProtocol {
    weak private var view: MissionDetailViewProtocol?
    var interactor: MissionDetailInteractorInputProtocol?
    private let router: MissionDetailWireframeProtocol

    init(interface: MissionDetailViewProtocol, interactor: MissionDetailInteractorInputProtocol?, router: MissionDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func presentObjective(from view: MissionDetailViewProtocol, on mission: Mission) {
        router.presentObjective(from: view, on: mission)
    }
    
    func presentPartner(from view: MissionDetailViewProtocol, on mission: Mission) {
        router.presentPartner(from: view, on: mission)
    }
    
    func getUpdatedMission(from mission: Mission) {
        interactor?.getUpdatedMission(from: mission)
    }
}

extension MissionDetailPresenter: MissionDetailInteractorOutputProtocol {
    func onGetUpdatedMission(with mission: Mission?) {
        view?.onGetUpdatedMission(with: mission)
    }

}

extension MissionDetailPresenter: MissionDetailWireframeOutputProtocol {
    func onFinishUpdateObjective() {
        view?.onFinishUpdateObjective()
    }
}
