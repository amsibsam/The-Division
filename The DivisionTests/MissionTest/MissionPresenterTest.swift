//
//  MissionPresenterTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class MissionPresenterTest: XCTestCase {
    var presenter: MissionPresenter!
    var interactor: MockMissionInteractor!
    var dataManager: MockMissionDataManager!
    var router: MockMissionRouter!
    var viewController: MockMissionViewController!
    
    override func setUp() {
        super.setUp()
        interactor = MockMissionInteractor()
        dataManager = MockMissionDataManager()
        router = MockMissionRouter()
        viewController = MockMissionViewController()
        presenter = MissionPresenter(interface: viewController, interactor: interactor, router: router)
        
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        dataManager.interactor = interactor
        viewController.presenter = presenter
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetNewMission() {
        presenter.getMission(with: .New)
        
        XCTAssertEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
    }
    
    func testGetInprogressMission() {
        presenter.getMission(with: .InProgress)
        
        XCTAssertEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
    }
    
    func testGetFinishedMission() {
        presenter.getMission(with: .Finished)
        
        XCTAssertEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((viewController.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
    }
    
    func testCreateMission() {
        let member = Member(id: "testMember01", name: "testMember", division: .Transportation, missionCount: 0, avatarURL: nil, pict: nil)
        presenter.createMission(with: "CreateTest", description: "CreateTest", assignee: member, objective: [])
        
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).name, "CreateTest")
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).description, "CreateTest")
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).state, .New)
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.id, "testMember01")
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.name, "testMember")
        XCTAssertEqual((viewController.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.division, .Transportation)
    }
    
    func testGetAllAgent() {
        presenter.getAllAgent()
        
        XCTAssertTrue((viewController.callbackResult["onGetAllAgentSucceed"]) is [Member])
        XCTAssertFalse((viewController.callbackResult["onGetAllAgentSucceed"]) is [Mission])
    }
    
    func testOpenMissionDetail() {
        let member = Member(id: "testMember01", name: "testMember", division: .Transportation, missionCount: 0, avatarURL: nil, pict: nil)
        var mission = Mission(id: "testMission01", name: "testMission", description: "test", state: .New)
        mission.assignee = member
        
        presenter.openMissionDetail(from: viewController, with: mission)
        
        XCTAssertEqual((router.callbackResult["openMissionDetail"] as! Mission).id, mission.id)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
