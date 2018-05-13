//
//  ObjectiveListViewTest.swift
//  appChallengeTests
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import XCTest
@testable import appChallenge

class ObjectiveListViewTest: XCTestCase {

    var sut: ObjectiveListViewController!
    var objectivessListPresenterMock: ObjectiveListPresenterMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        objectivessListPresenterMock = ObjectiveListPresenterMock()
        sut = ObjectiveListViewController.instantiate(presenter: objectivessListPresenterMock)
    }

    func releaseSut() {
        objectivessListPresenterMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    // MARK: - Test viewDidLoad
    func testLoadViewSuccess() {
        _ = sut.view
        sut.viewWillAppear(true)
        XCTAssertNotNil(sut.presenter, "Presenter must not be nil.")
        XCTAssertTrue(objectivessListPresenterMock.getObjectivesWasCalled)
    }

    // MARK: - Test show airports
    func testShowObjectives() {
        _ = sut.view
        let expectedObjectives = [ObjectiveListViewItemModel]()
        sut.showObjectiveList(objectivesList: expectedObjectives)
        XCTAssertEqual(expectedObjectives.count, sut.objectivesList.count)
    }

    // MARK: - Table View Tests
    func testNumberOfSectionsInTable() {
        _ = sut.view
        let expectedSections = 1
        let sections = sut.table.numberOfSections
        XCTAssertEqual(expectedSections, sections)
    }

    func testNumberOfRowsInSection() {
        _ = sut.view
        let objective = ObjectiveListViewItemModel(title: "titleTest",
                                                   description: "descriptionTest",
                                                   medalImage: UIImage(),
                                                   isCompleted: false)
        let expectedObjectives = [objective]
        sut.showObjectiveList(objectivesList: expectedObjectives)
        let expectedRows = expectedObjectives.count
        let rows = sut.table.numberOfRows(inSection: 0)
        XCTAssertEqual(expectedRows, rows)
    }

    func testCellForRowAtIndex() {
        _ = sut.view
        let objective = ObjectiveListViewItemModel(title: "titleTest",
                                                   description: "descriptionTest",
                                                   medalImage: UIImage(),
                                                   isCompleted: false)
        let expectedObjectives = [objective]
        sut.showObjectiveList(objectivesList: expectedObjectives)
        if let cell = sut.table.cellForRow(at: IndexPath(row: 0, section: 0)) as? ObjectiveListCell,
            let expectedCell = sut.table.dequeueReusableCell(withIdentifier: sut.kObjectiveListCellIdentifier,
                                                             for: IndexPath(row: 0, section: 0)) as? ObjectiveListCell {
            expectedCell.titleLabel.text = expectedObjectives[0].title
            XCTAssertEqual(expectedCell.titleLabel.text, cell.titleLabel.text)
        } else {
            XCTFail("The cells are of the wrong type")
        }
    }

}

class ObjectiveListPresenterMock: ObjectiveListPresenterProtocol {
    var view: ObjectiveListViewProtocol?
    var getObjectivesWasCalled = false
    var returnObjectiveFromIndexWasCalled = false

    func getObjectives() {
        getObjectivesWasCalled = true
    }

    func returnObjectiveFromIndex(indexPath: IndexPath) -> Objective {
        returnObjectiveFromIndexWasCalled = true
        return Objective(title: "title",
                         description: "description",
                         type: .step,
                         goal: 1,
                         progress: 1,
                         reward: Reward(trophy: .goldMedal,
                                        points: 10))
    }
}

