//
//  HomeContainerDataManagerTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 24/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class HomeContainerDataManagerTest: XCTestCase {
    var dataManager: HomeContainerDataManager!
    var interactor: MockHomeContainerInteractor!
    
    override func setUp() {
        super.setUp()
        dataManager = HomeContainerDataManager()
        interactor = MockHomeContainerInteractor()
        dataManager.interactor = interactor
        interactor.dataManager = dataManager
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetMenuItem() {
        dataManager.getMenuItem()
        
        XCTAssert(interactor.callbackResult["onGetMenuItemSucceed"] is [[MenuItem]])
    }
}
