//
//  LoginDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class LoginDataManager: LoginDataManagerInputProtocol {
    weak var interactor: LoginDataManagerOutputProtocol?
    var networkManager: NetworkService?
    
    func login(email: String, password: String) {
        networkManager?.login(username: email, password: password)
    }
}

extension LoginDataManager: NetworkServiceDelegate {
    func onError(with error: String) {
        interactor?.showError(with: error)
    }
    
    func onLoginSuccess(accessToken: String) {
        interactor?.showLoginSucceeded()
        DataCacheManager.shared.saveUserCredential(token: accessToken)
    }
}
