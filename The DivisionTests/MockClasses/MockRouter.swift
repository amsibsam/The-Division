//
//  MockLoginRouter.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockRegisterRouter: RegisterWireframeProtocol {
    var callbackResult = [String: AnyObject]()
    
}

class MockLoginRouter: LoginWireframeProtocol {

    var callbackResult = [String: AnyObject]()
    
    func goToHome() {
        callbackResult["goToHome"] = "" as AnyObject
    }
    
    func goToRegister() {
        callbackResult["goToRegister"] = "" as AnyObject
    }
    
}


class MockHomeContainerRouter: HomeContainerWireframeProtocol {
    var callbackResult = [String: AnyObject]()
    
}

class MockMissionRouter: MissionRouter {
    var callbackResult = [String: AnyObject]()
    override func openMissionDetail(from view: MissionViewProtocol, with mission: Mission) {
        callbackResult["openMissionDetail"] = mission as AnyObject
    }
}
