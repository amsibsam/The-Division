//
//  MissionInteractorTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 23/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class MissionInteractorTest: XCTestCase {
    var interactor: MissionInteractor!
    var presenter: MockMissionPresenter!
    var dataManager: MockMissionDataManager!
    
    override func setUp() {
        super.setUp()
        interactor = MissionInteractor()
        presenter = MockMissionPresenter()
        dataManager = MockMissionDataManager()
        
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        dataManager.interactor = interactor
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetNewMission() {
        interactor.getMission(with: .New)
        
        XCTAssertEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
    }
    
    func testGetInprogressMission() {
        interactor.getMission(with: .InProgress)
        
        XCTAssertEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
    }
    
    func testGetFinishedMission() {
        interactor.getMission(with: .Finished)
        
        XCTAssertEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .Finished)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .InProgress)
        XCTAssertNotEqual((presenter.callbackResult["onGetMissionSucceeded"] as! [Mission])[0].state, .New)
    }
    
    func testCreateMission() {
        let member = Member(id: "testMember01", name: "testMember", division: .Transportation, missionCount: 0, avatarURL: nil, pict: nil)
        interactor.createMission(with: "CreateTest", description: "CreateTest", assignee: member, objective: [])
        
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).name, "CreateTest")
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).description, "CreateTest")
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).state, .New)
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.id, "testMember01")
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.name, "testMember")
        XCTAssertEqual((presenter.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.division, .Transportation)
    }
    
    func testGetAllAgent() {
        interactor.getAllAgent()
        
        XCTAssertTrue((presenter.callbackResult["onGetAllAgentSuceeded"]) is [Member])
        XCTAssertFalse((presenter.callbackResult["onGetAllAgentSuceeded"]) is [Mission])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
