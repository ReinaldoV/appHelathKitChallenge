//
//  ObjectiveListContracts.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

protocol ObjectiveListViewProtocol: class {
    func showObjectiveList(objectivesList: [ObjectiveListViewItemModel])
}

protocol ObjectiveListPresenterProtocol: class {
    var view: ObjectiveListViewProtocol? { get set }
    func getObjectives()
    func returnObjectiveFromIndex(indexPath: IndexPath) -> Objective
}
