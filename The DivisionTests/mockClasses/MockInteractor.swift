//
//  MockLoginInteractor.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockLoginInteractor: LoginInteractorInputProtocol, LoginDataManagerOutputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    var dataManager: LoginDataManagerInputProtocol?
    
    func login(email: String, password: String) {
        dataManager?.login(email: email, password: password)
    }
    
    func showLoginSucceeded() {
        presenter?.showLoginSucceeded()
    }
    
    func showError(with message: String) {
        presenter?.showError(with: message)
    }
    
}

class MockHomeContainerInteractor: HomeContainerInteractorInputProtocol, HomeContainerDataManagerOutputProtocol {
    var presenter: HomeContainerInteractorOutputProtocol?
    
    var dataManager: HomeContainerDataManagerInputProtocol?
    
    func getMenuItem() {
        dataManager?.getMenuItem()
    }
    
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        presenter?.onGetMenuItemSucceed(menuItems: menuItems)
    }
}
