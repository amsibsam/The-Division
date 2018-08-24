//
//  HomeContainerInteractorTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class HomeContainerInteractorTest: XCTestCase {
    var interactor: HomeContainerInteractor!
    var presenter: MockHomeContainerPresenter!
    var dataManager: MockHomeContainerDataManager!
    
    override func setUp() {
        super.setUp()
        interactor = HomeContainerInteractor()
        presenter = MockHomeContainerPresenter()
        dataManager = MockHomeContainerDataManager()
        
        interactor.presenter = presenter
        dataManager.interactor = interactor
        interactor.dataManager = dataManager
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSuccessDisplayMenuItem() {
        interactor.getMenuItem()
        
        XCTAssert(presenter.callbackResult["onGetMenuItemSucceed"] is [[MenuItem]])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
