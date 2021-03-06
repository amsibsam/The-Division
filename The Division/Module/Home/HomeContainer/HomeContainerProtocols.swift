//
//  HomeContainerProtocols.swift
//  The Division
//
//  Created MTMAC16 on 14/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeContainerWireframeProtocol: class {

}
//MARK: Presenter -
protocol HomeContainerPresenterProtocol: class {

    var interactor: HomeContainerInteractorInputProtocol? { get set }
    
    /* View -> Presenter */
    func getMenuItem()
}

//MARK: Interactor -
protocol HomeContainerInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func onGetMenuItemSucceed(menuItems: [[MenuItem]])
}

protocol HomeContainerInteractorInputProtocol: class {

    var presenter: HomeContainerInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func getMenuItem()
}

//MARK: View -
protocol HomeContainerViewProtocol: class {

    var presenter: HomeContainerPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func onGetMenuItemSucceed(menuItems: [[MenuItem]])
}

protocol HomeContainerDataManagerInputProtocol: class {
    var interactor: HomeContainerDataManagerOutputProtocol? { get set }
    
    /* Interactor -> DataManager */
    func getMenuItem()
}

protocol HomeContainerDataManagerOutputProtocol: class {
    /* DataManager -> Interactor */
    func onGetMenuItemSucceed(menuItems: [[MenuItem]])
}
