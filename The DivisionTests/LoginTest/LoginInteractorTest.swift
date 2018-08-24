//
//  LoginInteractorTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class LoginInteractorTest: XCTestCase {
    var interactor: LoginInteractor!
    var dataManager: MockLoginDataManager!
    var presenter: MockLoginPresenter!
    
    override func setUp() {
        super.setUp()
        interactor = LoginInteractor()
        dataManager = MockLoginDataManager()
        presenter = MockLoginPresenter()
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        dataManager.interactor = interactor
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWrongPassword() {
        let form = (email: "amsibsam", password: "12345")
        interactor.login(email: form.email, password: form.password)
        
        XCTAssertEqual(presenter.callbackResult["showError"]?.description, "wrong username or password")
        XCTAssertFalse(((presenter.callbackResult["showLoginSucceeded"]?.description) != nil), "")
    }
    
    func testLoginSucceed() {
        let form = (email: "amsibsam", password: "123")
        interactor.login(email: form.email, password: form.password)
        
        XCTAssertEqual(presenter.callbackResult["showLoginSucceeded"]?.description, "")
        XCTAssertFalse(((presenter.callbackResult["showError"]?.description) != nil), "wrong username or password")
    }
    
    func testNoInternet() {
        
    }
    
    func testUnexpectedResponseFromServer() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
