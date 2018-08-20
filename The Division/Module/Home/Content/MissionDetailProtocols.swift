//
//  MissionDetailProtocols.swift
//  The Division
//
//  Created MTMAC16 on 20/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol MissionDetailWireframeProtocol: class {

}
//MARK: Presenter -
protocol MissionDetailPresenterProtocol: class {

    var interactor: MissionDetailInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol MissionDetailInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol MissionDetailInteractorInputProtocol: class {

    var presenter: MissionDetailInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol MissionDetailViewProtocol: class {

    var presenter: MissionDetailPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
