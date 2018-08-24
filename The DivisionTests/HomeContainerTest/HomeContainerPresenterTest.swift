//
//  HomeContainerPresenterTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class HomeContainerPresenterTest: XCTestCase {
    var presenter: HomeContainerPresenter!
    var viewController: MockHomeViewController!
    var interactor: MockHomeContainerInteractor!
    var dataManager: MockHomeContainerDataManager!
    var router: MockHomeContainerRouter!

    
    override func setUp() {
        super.setUp()
        viewController = MockHomeViewController()
        interactor = MockHomeContainerInteractor()
        dataManager = MockHomeContainerDataManager()
        router = MockHomeContainerRouter()
        presenter = HomeContainerPresenter(interface: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSuccessDisplayMenuItem() {
        presenter.getMenuItem()
        
        XCTAssertEqual(viewController.callbackResult["onGetMenuItemSucceed"]?.description, "menuItems")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
