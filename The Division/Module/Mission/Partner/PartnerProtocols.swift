//
//  PartnerProtocols.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol PartnerWireframeProtocol: class {

}
//MARK: Presenter -
protocol PartnerPresenterProtocol: class {

    var interactor: PartnerInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol PartnerInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol PartnerInteractorInputProtocol: class {

    var presenter: PartnerInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol PartnerViewProtocol: class {

    var presenter: PartnerPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}