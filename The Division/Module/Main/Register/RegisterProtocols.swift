//
//  RegisterProtocols.swift
//  The Division
//
//  Created MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol RegisterWireframeProtocol: class {

}
//MARK: Presenter -
protocol RegisterPresenterProtocol: class {

    var interactor: RegisterInteractorInputProtocol? { get set }
    
    /* ViewController -> Presenter */
    func register(name: String, password: String, passwordConfirmation: String, email: String)
}

//MARK: Interactor -
protocol RegisterInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func onRegisterSucceeded()
    func onRegisterError(with message: String)
}

protocol RegisterInteractorInputProtocol: class {

    var presenter: RegisterInteractorOutputProtocol?  { get set }
    var dataManager: RegisterDataManagerInputProtocol? {get set}

    /* Presenter -> Interactor */
    func register(name: String, password: String, passwordConfirmation: String, email: String)
}

//MARK: View -
protocol RegisterViewProtocol: class {

    var presenter: RegisterPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func onRegisterSucceeded()
    func onRegisterError(with message: String)
    func showLoading()
    func dismissLoading()
}

//MARK: DataManager -
protocol RegisterDataManagerInputProtocol: class {
    var interactor: RegisterDataManagerOutputProtocol? { get set }
    var networkManager: NetworkService? { get set }
    
    /* Interactor -> DataManager */
    func register(name: String, password: String, passwordConfirmation: String, email: String)
}

protocol RegisterDataManagerOutputProtocol: class {
    /* DataManager -> Interactor */
    func onRegisterSucceeded()
    func onRegisterError(with message: String )
}
