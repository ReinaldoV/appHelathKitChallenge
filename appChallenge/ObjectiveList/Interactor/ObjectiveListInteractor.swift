//
//  ObjectiveListInteractor.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import Foundation

protocol ObjectiveListInteractorProtocol: class {
    func getObjectives(onCompletion: @escaping ([Objective]) -> Void)
}

class ObjectiveListInteractor: ObjectiveListInteractorProtocol {

    private let kObjectivesUserDefault = "kObjectivesUserDefault"

    func getObjectives(onCompletion: @escaping ([Objective]) -> Void) {
        let healthKitCommunication = HealthKitCommunication()

        healthKitCommunication.getTodaySteps { (todaySteps) in
            healthKitCommunication.getTodayDistanceWalkedAndRunned { (todayDistance) in
                ObjectivesServices().getObjectives(onSuccess: { objectiveListWithOutProgres in
                    
                    if let encoded = try? JSONEncoder().encode(objectiveListWithOutProgres) {
                        UserDefaults.standard.set(encoded, forKey: self.kObjectivesUserDefault)
                    }
                    
                    let objectiveList: [Objective] = self.giveObjectives(objectiveListWithOutProgres: objectiveListWithOutProgres,
                                                                         todaySteps: todaySteps,
                                                                         todayDistance: todayDistance)
                    onCompletion(objectiveList)
                }) { error in
                    print(error?.localizedDescription as Any)

                    if let userData = UserDefaults.standard.data(forKey: self.kObjectivesUserDefault),
                        let objectiveListWithOutProgres = try? JSONDecoder().decode([Objective].self, from: userData) {
                        let objectiveList: [Objective] = self.giveObjectives(objectiveListWithOutProgres: objectiveListWithOutProgres,
                                                                             todaySteps: todaySteps,
                                                                             todayDistance: todayDistance)
                        onCompletion(objectiveList)
                    }
                }
            }
        }
    }

    private func giveObjectives(objectiveListWithOutProgres: [Objective],
                                todaySteps: Double,
                                todayDistance: Double) -> [Objective] {
        var objectiveList: [Objective] = []

        for objectiveWithoutProgress in objectiveListWithOutProgres {
            var progress: Double = 0
            if objectiveWithoutProgress.type == .step {
                progress = todaySteps
            } else {
                progress = todayDistance
            }
            let objective = Objective(title: objectiveWithoutProgress.title,
                                      description: objectiveWithoutProgress.description,
                                      type: objectiveWithoutProgress.type,
                                      goal: objectiveWithoutProgress.goal,
                                      progress: progress,
                                      reward: objectiveWithoutProgress.reward)
            objectiveList.append(objective)
        }
        return objectiveList
    }
}
