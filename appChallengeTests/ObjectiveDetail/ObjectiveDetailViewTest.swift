//
//  ObjectiveDetailViewTest.swift
//  appChallengeTests
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import XCTest
@testable import appChallenge

class ObjectiveDetailViewTest: XCTestCase {

    var sut: ObjectiveDetailViewController!
    var objectiveDetailPresenterMock: ObjectiveDetailPresenterMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        releaseSut()
        super.tearDown()
    }

    func createSut() {
        objectiveDetailPresenterMock = ObjectiveDetailPresenterMock()
        sut = ObjectiveDetailViewController.instantiate(presenter: objectiveDetailPresenterMock)
    }

    func releaseSut() {
        objectiveDetailPresenterMock = nil
        sut = nil
    }

    // MARK: - Basic test.
    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }
    
    // MARK: - Test viewDidLoad
    func testLoadViewSuccess() {
        _ = sut.view
        XCTAssertNotNil(sut.presenter, "Presenter must not be nil.")
        XCTAssertTrue(objectiveDetailPresenterMock.getObjectiveInfoWasCalled)
    }
    
    // MARK: - Test show objectives
    func testShowObjectives() {
        _ = sut.view
        let expectedObjectiveDetail = ObjectiveDetailViewModel(title: "title",
                                                               description: "description",
                                                               percentage: "50",
                                                               current: 50,
                                                               goal: 100,
                                                               throphyImage: UIImage(),
                                                               isCompleted: false)
        sut.refreshObjective(objective: expectedObjectiveDetail)
        XCTAssertEqual(sut.titleLabel.text, expectedObjectiveDetail.title)
        XCTAssertEqual(sut.descriptionLabel.text, expectedObjectiveDetail.description)
        XCTAssertEqual(sut.percentageLabel.text, expectedObjectiveDetail.percentage+"%")
        XCTAssertEqual(sut.trophyImageView.image, expectedObjectiveDetail.throphyImage)
        XCTAssertEqual(sut.trophyImageView.isHidden, !expectedObjectiveDetail.isCompleted)
        XCTAssertEqual(sut.checkImageView.isHidden, !expectedObjectiveDetail.isCompleted)
    }
}

class ObjectiveDetailPresenterMock: ObjectiveDetailPresenterProtocol {
    var view: ObjectiveDetailViewProtocol?
    var getObjectiveInfoWasCalled = false
    
    func getObjectiveInfo() {
        getObjectiveInfoWasCalled = true
    }
}
