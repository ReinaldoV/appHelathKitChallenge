//
//  ObjectiveDetailPresenterTest.swift
//  appChallengeTests
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import XCTest
@testable import appChallenge

class ObjectiveDetailPresenterTest: XCTestCase {

    var sut: ObjectiveDetailPresenter!
    var objectiveDetailViewMock: ObjectiveDetailViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        objectiveDetailViewMock = ObjectiveDetailViewMock()
        sut = ObjectiveDetailPresenter(objective: Objective(title: "title",
                                                            description: "description",
                                                            type: .step,
                                                            goal: 1,
                                                            progress: 1,
                                                            reward: Reward(trophy: .goldMedal,
                                                                           points: 10)))
        sut.view = objectiveDetailViewMock
    }

    func releaseSut() {
        objectiveDetailViewMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }


    // MARK: - GetObjectives test.
    func testGetObjectiveInfo() {
        sut.getObjectiveInfo()
        XCTAssertTrue(objectiveDetailViewMock.refreshObjectiveWasCalled)
    }

}

class ObjectiveDetailViewMock: ObjectiveDetailViewProtocol {
    var refreshObjectiveWasCalled = false
    func refreshObjective(objective: ObjectiveDetailViewModel) {
        refreshObjectiveWasCalled = true
    }
}
