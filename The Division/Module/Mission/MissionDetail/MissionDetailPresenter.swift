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

class MissionDetailPresenter: MissionDetailPresenterProtocol, MissionDetailInteractorOutputProtocol {

    weak private var view: MissionDetailViewProtocol?
    var interactor: MissionDetailInteractorInputProtocol?
    private let router: MissionDetailWireframeProtocol

    init(interface: MissionDetailViewProtocol, interactor: MissionDetailInteractorInputProtocol?, router: MissionDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func presentObjective(from view: MissionDetailViewProtocol) {
        router.presentObjective(from: view)
    }
    
    func presentPartner(from view: MissionDetailViewProtocol) {
        router.presentPartner(from: view)
    }
    

    
}
