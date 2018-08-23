//
//  MockLoginPresenter.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockLoginPresenter: LoginInteractorOutputProtocol {
    var callbackResult = [String: AnyObject]()
    
    func showLoginSucceeded() {
        callbackResult["showLoginSucceeded"] = "" as AnyObject
    }
    
    func showError(with message: String) {
        callbackResult["showError"] = message as AnyObject
    }
}

class MockHomeContainerPresenter: HomeContainerInteractorOutputProtocol {
    var callbackResult = [String: AnyObject]()
    
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        callbackResult["onGetMenuItemSucceed"] = "menuItems" as AnyObject
    }
}
