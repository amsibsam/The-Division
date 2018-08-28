//
//  PartnerPresenter.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PartnerPresenter: PartnerPresenterProtocol, PartnerInteractorOutputProtocol {

    weak private var view: PartnerViewProtocol?
    var interactor: PartnerInteractorInputProtocol?
    private let router: PartnerWireframeProtocol

    init(interface: PartnerViewProtocol, interactor: PartnerInteractorInputProtocol?, router: PartnerWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
