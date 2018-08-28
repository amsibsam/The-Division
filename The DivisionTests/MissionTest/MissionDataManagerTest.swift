//
//  MissionDataManagerTest.swift
//  The DivisionTests
//
//  Created by MTMAC16 on 24/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import XCTest
@testable import The_Division

class MissionDataManagerTest: XCTestCase {
    var dataManager: MissionDataManager!
    var interactor: MockMissionInteractor!
    
    
    override func setUp() {
        super.setUp()
        dataManager = MissionDataManager()
        interactor = MockMissionInteractor()
        
        dataManager.interactor = interactor
        interactor.dataManager = dataManager
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetNewMission() {
        dataManager.getMission(with: .New)
        
        let pred = NSPredicate(format: "onGetMissionSucceeded == %@", "[Mission]")
        let exp = expectation(for: pred, evaluatedWith: (interactor.callbackResult), handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: 3.0)
        XCTAssert(interactor.callbackResult["onGetMissionSucceeded"] is [Mission])
        
        if let firstItem = (interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).first {
            XCTAssert((firstItem.state == .New))
        } else {
            XCTAssert((interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).count == 0)
        }
    }
    
    func testGetInprogressMission() {
        dataManager.getMission(with: .InProgress)
        
        let pred = NSPredicate(format: "onGetMissionSucceeded == %@", "[Mission]")
        let exp = expectation(for: pred, evaluatedWith: (interactor.callbackResult), handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: 3.0)
        XCTAssert(interactor.callbackResult["onGetMissionSucceeded"] is [Mission])
        
        if let firstItem = (interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).first {
            XCTAssert((firstItem.state == .InProgress))
        } else {
            XCTAssert((interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).count == 0)
        }
    }

    func testGetFinishedMission() {
        dataManager.getMission(with: .Finished)
        
        let pred = NSPredicate(format: "onGetMissionSucceeded == %@", "[Mission]")
        let exp = expectation(for: pred, evaluatedWith: (interactor.callbackResult), handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: 3.0)
        XCTAssert(interactor.callbackResult["onGetMissionSucceeded"] is [Mission])
        
        if let firstItem = (interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).first {
            XCTAssert((firstItem.state == .Finished))
        } else {
            XCTAssert((interactor.callbackResult["onGetMissionSucceeded"] as! [Mission]).count == 0)
        }
    }

    func testCreateMission() {
        let member = Member(id: "testMember01", name: "testMember", division: .Transportation, missionCount: 0, avatarURL: nil, pict: nil)
        dataManager.createMission(with: "testingMission", description: "just testing", assignee: member, objective: [])

        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).name, "testingMission")
        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).description, "just testing")
        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).state, .New)
        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.id, "testMember01")
        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.name, "testMember")
        XCTAssertEqual((interactor.callbackResult["onCreateMissionSucceeded"] as! Mission).assignee?.division, .Transportation)
    }

    func testGetAllAgent() {
        interactor.getAllAgent()

        let pred = NSPredicate(format: "onGetAllAgentSucceeded == %@", "[Member]")
        let exp = expectation(for: pred, evaluatedWith: interactor.callbackResult, handler: nil)
        _ = XCTWaiter.wait(for: [exp], timeout: 3.0)
        
        XCTAssertTrue((interactor.callbackResult["onGetAllAgentSucceeded"]) is [Member])
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
