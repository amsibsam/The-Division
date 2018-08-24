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
        DataCacheManager.shared.saveUserCredential(token: password)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.interactor?.showLoginSucceeded()
        }
    }
    
    
}
