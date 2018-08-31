//
//  RegisterPresenterTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class RegisterPresenterTest: XCTestCase {
    var presenter: RegisterPresenter!
    var view: MockRegisterViewController!
    var interactor: MockRegisterInteractor!
    var router: MockRegisterRouter!
    var dataManager: MockRegisterDataManager!
    
    override func setUp() {
        super.setUp()
        view = MockRegisterViewController()
        interactor = MockRegisterInteractor()
        router = MockRegisterRouter()
        dataManager = MockRegisterDataManager()
        
        presenter = RegisterPresenter(interface: view, interactor: interactor, router: router)
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        dataManager.interactor = interactor
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInvalidDataRegister() {
        let data = (name: "", password: "123", passwordConfirmation: "123", email: "a@b.com")
        
        presenter.register(name: data.name, password: data.password, passwordConfirmation: data.passwordConfirmation, email: data.email)
        
        XCTAssert(view.callbackResult["onRegisterError"]?.description == "Please fill all the data")
    }
    
    func testPasswordConfirmationDidNotMatch() {
        let data = (name: "mantab", password: "123", passwordConfirmation: "123", email: "a@b.com")
        
        presenter.register(name: data.name, password: data.password, passwordConfirmation: data.passwordConfirmation, email: data.email)
        
        XCTAssert(view.callbackResult["showLoading"]?.description == "")
        XCTAssert(view.callbackResult["onRegisterSucceeded"]?.description == "")
        XCTAssert(view.callbackResult["dismissLoading"]?.description == "")
    }
    
    func testSuccessRegister() {
        let data = (name: "mantab", password: "1234", passwordConfirmation: "123", email: "a@b.com")
        
        presenter.register(name: data.name, password: data.password, passwordConfirmation: data.passwordConfirmation, email: data.email)
        
        XCTAssert(view.callbackResult["onRegisterError"]?.description == "Please check your password")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
