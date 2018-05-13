//
//  ObjectiveListInteractorTest.swift
//  appChallengeTests
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import XCTest
@testable import appChallenge

class ObjectiveListInteractorTest: XCTestCase {
    var sut: ObjectiveListInteractor!
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    override func tearDown() {
        releaseSut()
        super.tearDown()
    }
    
    func createSut() {
        sut = ObjectiveListInteractor()
    }
    
    func releaseSut() {
        sut = nil
    }
    
    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }
    
    // MARK: - Get Airports test.
    func testGetAirportsHappyCase() {
        sut.getObjectives { objectives in
            XCTAssertNotNil(objectives)
            XCTAssertTrue(objectives.count > 0)
        }
    }
    
}

