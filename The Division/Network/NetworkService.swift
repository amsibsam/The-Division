//
//  NetworkService.swift
//  The Division
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

protocol NetworkService {
    func register(name: String, password: String, passwordConfirmation: String, email: String)
    func login(username: String, password: String)
}

@objc protocol NetworkServiceDelegate {
    func onError(with error: String)
    @objc optional func onLoginSuccess(accessToken: String)
    @objc optional func onRegisterSuccess()
}
