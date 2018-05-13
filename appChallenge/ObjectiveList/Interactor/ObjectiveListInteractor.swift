//
//  ObjectiveListInteractor.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

protocol ObjectiveListInteractorProtocol: class {
    func getObjectives() -> [Objective]
}

class ObjectiveListInteractor: ObjectiveListInteractorProtocol {
    func getObjectives() -> [Objective] {
        var objectivesWithoutProgress: [Objective] = []
        
        ObjectivesServices().getObjectives(onSuccess: { objectiveList in
            objectivesWithoutProgress = objectiveList
        }) { error in
            print(error?.localizedDescription)
        }
        
        return []
    }
}
