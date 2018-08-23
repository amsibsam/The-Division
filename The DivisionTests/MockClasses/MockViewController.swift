//
//  MockLoginViewController.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import XCTest
@testable import The_Division

class MockLoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?
    var callbackResult = [String: AnyObject]()
    
    func showLoginSucceeded() {
        presenter?.goToHome()
        callbackResult["showLoginSucceed"] = "" as AnyObject
    }
    
    func showLoading() {
        callbackResult["showLoading"] = "" as AnyObject
    }
    
    func showError(with message: String) {
        callbackResult["showError"] = message as AnyObject
    }
    
    func dismissLoading() {
        callbackResult["dismissLoading"] = "" as AnyObject
    }
}

class MockHomeViewController: UIViewController, HomeContainerViewProtocol {
    var presenter: HomeContainerPresenterProtocol?
    var callbackResult = [String: AnyObject]()
    
    func onGetMenuItemSucceed(menuItems: [[MenuItem]]) {
        callbackResult["onGetMenuItemSucceed"] = "menuItems" as AnyObject
    }
}

class MockMissionViewControlelr: UIViewController, MissionViewProtocol {
    var presenter: MissionPresenterProtocol?
    var callbackResult = [String: AnyObject]()
    
    func onGetMissionSucceeded(with missions: [Mission]) {
        callbackResult["onGetMissionSucceeded"] = missions as AnyObject
    }
    
    func onCreateMissionSucceeded(with mission: Mission) {
        callbackResult["onCreateMissionSucceeded"] = mission as AnyObject
    }
    
    func onGetAllAgentSucceed(with agents: [Member]) {
        callbackResult["onGetAllAgentSucceed"] = agents as AnyObject
    }
}
