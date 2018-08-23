//
//  LoginPresenterTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class LoginPresenterTest: XCTestCase {
    var presenter: LoginPresenter!
    weak var view: LoginInteractorInputProtocol!
    var interactor: MockLoginInteractor!
    var router: MockLoginRouter!
    var viewController: MockLoginViewController!
    var dataManager: MockLoginDataManager!
    
    override func setUp() {
        super.setUp()
        self.router = MockLoginRouter()
        self.viewController = MockLoginViewController()
        self.interactor = MockLoginInteractor()
        self.dataManager = MockLoginDataManager()
        
        presenter = LoginPresenter(interface: viewController, interactor: interactor, router: router)
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        viewController.presenter = presenter
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: test case
    
    func testEmptyUsername() {
        let form = (email:"",password:"123")
        XCTAssertFalse(presenter.isValidLoginData(email: form.email, password: form.password))
        
        presenter.login(email: form.email, password: form.password)
        XCTAssertEqual(viewController.callbackResult["showLoading"]?.description, "")
        XCTAssertEqual(viewController.callbackResult["showError"]?.description, "Please fill your email and password")
        XCTAssertEqual(viewController.callbackResult["dismissLoading"]?.description, "")
        XCTAssertFalse(((viewController.callbackResult["showLoginSucceed"]?.description) != nil), "")
        XCTAssertFalse(((router.callbackResult["goToHome"]?.description) != nil), "")
    }
    
    func testEmptyPassword() {
        let form = (email:"ahay",password:"")
        XCTAssertFalse(presenter.isValidLoginData(email: form.email, password: form.password))
        
        presenter.login(email: form.email, password: form.password)
        XCTAssertEqual(viewController.callbackResult["showLoading"]?.description, "")
        XCTAssertEqual(viewController.callbackResult["showError"]?.description, "Please fill your email and password")
        XCTAssertEqual(viewController.callbackResult["dismissLoading"]?.description, "")
        XCTAssertFalse(((viewController.callbackResult["showLoginSucceed"]?.description) != nil), "")
        XCTAssertFalse(((router.callbackResult["goToHome"]?.description) != nil), "")
    }
    
    func testWrongPasswordOrEmail() {
        let form = (email: "wrong", password: "321")
        XCTAssertTrue(presenter.isValidLoginData(email: form.email, password: form.password))
        
        presenter.login(email: form.email, password: form.password)
        XCTAssertEqual(viewController.callbackResult["showLoading"]?.description, "")
        XCTAssertEqual(viewController.callbackResult["showError"]?.description, "wrong username or password")
        XCTAssertEqual(viewController.callbackResult["dismissLoading"]?.description, "")
        XCTAssertFalse(((viewController.callbackResult["showLoginSucceed"]?.description) != nil), "")
        XCTAssertFalse(((router.callbackResult["goToHome"]?.description) != nil), "")
    }
    
    func testSucceedLogin() {
        let form = (email: "amsibsam", password: "123")
        XCTAssertTrue(presenter.isValidLoginData(email: form.email, password: form.password))
        
        presenter.login(email: form.email, password: form.password)
        XCTAssertEqual(viewController.callbackResult["showLoading"]?.description, "")
        XCTAssertEqual(viewController.callbackResult["showLoginSucceed"]?.description, "")
        XCTAssertEqual(viewController.callbackResult["dismissLoading"]?.description, "")
        XCTAssertEqual(router.callbackResult["goToHome"]?.description, "")
        XCTAssertFalse(((viewController.callbackResult["showError"]?.description) != nil), "wrong username or password")
        XCTAssertFalse(((viewController.callbackResult["showError"]?.description) != nil), "Please fill your email and password")
    }

}
