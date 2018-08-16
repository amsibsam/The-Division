//
//  MissionPresenter.swift
//  The Division
//
//  Created MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MissionPresenter: MissionPresenterProtocol, MissionInteractorOutputProtocol {

    weak private var view: MissionViewProtocol?
    var interactor: MissionInteractorInputProtocol?
    private let router: MissionWireframeProtocol

    init(interface: MissionViewProtocol, interactor: MissionInteractorInputProtocol?, router: MissionWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
