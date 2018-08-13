//
//  LoginDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 13/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class LoginDataManager: LoginDataManagerInputProtocol {
    var interactor: LoginDataManagerOutputProtocol?
    
    func login(email: String, password: String) {
        interactor?.showLoginSucceeded()
    }
    
    
}
