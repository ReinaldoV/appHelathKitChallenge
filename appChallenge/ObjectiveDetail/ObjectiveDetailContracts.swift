//
//  ObjectiveDetailContracts.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

protocol ObjectiveDetailViewProtocol: class {
    func refreshObjective(objective: ObjectiveDetailViewModel)
}

protocol ObjectiveDetailPresenterProtocol: class {
    var view: ObjectiveDetailViewProtocol? { get set }
    func getObjectiveInfo()
}
