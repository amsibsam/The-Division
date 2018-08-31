//
//  RegisterDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class RegisterDataManager: RegisterDataManagerInputProtocol {
    var interactor: RegisterDataManagerOutputProtocol?
    
    var networkManager: NetworkService?
    
    func register(name: String, password: String, passwordConfirmation: String, email: String) {
        networkManager?.register(name: name, password: password, passwordConfirmation: passwordConfirmation, email: email)
    }
}

extension RegisterDataManager: NetworkServiceDelegate {
    func onError(with error: String) {
        interactor?.onRegisterError(with: error.description)
    }
    
    func onRegisterSuccess() {
        interactor?.onRegisterSucceeded()
    }
}


