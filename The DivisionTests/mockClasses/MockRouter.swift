//
//  MockLoginRouter.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
@testable import The_Division

class MockLoginRouter : LoginWireframeProtocol {
    var callbackResult = [String: AnyObject]()
    
    func goToHome() {
        callbackResult["goToHome"] = "" as AnyObject
    }
}


class MockHomeContainerRouter : HomeContainerWireframeProtocol {
    var callbackResult = [String: AnyObject]()
    
}
