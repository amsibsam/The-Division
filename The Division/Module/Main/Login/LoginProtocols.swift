//
//  LoginProtocols.swift
//  The Division
//
//  Created MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {

}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
    
    /* ViewController -> Presenter */
    func login(email: String, password: String)
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func showLoginSucceeded()
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }
    var dataManager: LoginDataManagerInputProtocol? { get set }
    /* Presenter -> Interactor */
    func login(email: String, password: String)
}

//MARK: DataManager -
protocol LoginDataManagerInputProtocol: class {
    var interactor: LoginDataManagerOutputProtocol? { get set }
    func login(email: String, password: String)
}

protocol LoginDataManagerOutputProtocol {
    func showLoginSucceeded()
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func showLoginSucceeded()
    func showLoading()
    func showError(with message: String)
    func dismissLoading()
}
