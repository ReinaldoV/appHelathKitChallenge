//
//  ObjectiveListPresenterTest.swift
//  appChallengeTests
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import XCTest
@testable import appChallenge

class ObjectiveListPresenterTest: XCTestCase {

    var sut: ObjectiveListPresenter!
    var objectiveListInteractorMock: ObjectiveListInteractorMock!
    var objectiveListViewMock: ObjectiveListViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        objectiveListInteractorMock = ObjectiveListInteractorMock()
        objectiveListViewMock = ObjectiveListViewMock()
        sut = ObjectiveListPresenter(interactor: objectiveListInteractorMock)
        sut.view = objectiveListViewMock
    }

    func releaseSut() {
        objectiveListInteractorMock = nil
        objectiveListViewMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }


    // MARK: - GetAirports test.
    func testGetObjectives() {
        sut.getObjectives()
        XCTAssertTrue(objectiveListInteractorMock.getObjectivesWasCalled)
    }

    func testGetObjectiveFromIndexPath() {
        sut.objectives = [Objective(title: "title",
                                    description: "description",
                                    type: .step,
                                    goal: 1,
                                    progress: 1,
                                    reward: Reward(trophy: .goldMedal,
                                                   points: 10))]
        let objective = sut.returnObjectiveFromIndex(indexPath: IndexPath(row: 0, section: 0))
        let expectedObjective = Objective(title: "title",
                                          description: "description",
                                          type: .step,
                                          goal: 1,
                                          progress: 1,
                                          reward: Reward(trophy: .goldMedal,
                                                         points: 10))
        XCTAssertEqual(objective, expectedObjective)
    }

}

class ObjectiveListInteractorMock: ObjectiveListInteractorProtocol {
    var getObjectivesWasCalled = false
    func getObjectives(onCompletion: @escaping ([Objective]) -> Void) {
        getObjectivesWasCalled = true
        onCompletion([Objective(title: "title",
                                description: "description",
                                type: .step,
                                goal: 1,
                                progress: 1,
                                reward: Reward(trophy: .goldMedal,
                                               points: 10))])
    }
}

class ObjectiveListViewMock: ObjectiveListViewProtocol {
    var showObjectiveListWasCalled = false
    func showObjectiveList(objectivesList: [ObjectiveListViewItemModel]) {
        showObjectiveListWasCalled = true
    }
}
