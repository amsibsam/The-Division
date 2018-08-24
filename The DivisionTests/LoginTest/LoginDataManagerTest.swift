//
//  LoginDataManagerTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 24/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class LoginDataManagerTest: XCTestCase {
    var dataManager: LoginDataManager!
    var interactor: MockLoginInteractor!
    
    override func setUp() {
        super.setUp()
        dataManager = LoginDataManager()
        interactor = MockLoginInteractor()
        dataManager.interactor = interactor
        interactor.dataManager = dataManager
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSucceededLogin() {
        dataManager.login(email: "mantab", password: "asek")
        
        let pred = NSPredicate(format: "showLoginSucceeded == %@", "")
        let exp = expectation(for: pred, evaluatedWith: interactor.callbackResult, handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: TestingConstant.REQUEST_TIMEOUT)
        _ = XCTWaiter.Result.completed
        XCTAssert(interactor.callbackResult["showLoginSucceeded"]?.description == "", "should trigger showLoginSecceeded in interactor")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
