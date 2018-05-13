//
//  ObjectiveListInteractor.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

protocol ObjectiveListInteractorProtocol: class {
    func getObjectives(onCompletion: @escaping ([Objective]) -> Void)
}

class ObjectiveListInteractor: ObjectiveListInteractorProtocol {

    func getObjectives(onCompletion: @escaping ([Objective]) -> Void) {
        let healthKitCommunication = HealthKitCommunication()
        
        healthKitCommunication.getTodaySteps { (todaySteps) in
            healthKitCommunication.getTodayDistanceWalkedAndRunned { (todayDistance) in
                ObjectivesServices().getObjectives(onSuccess: { objectiveListWithOutProgres in
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
                    onCompletion(objectiveList)
                }) { error in
                    print(error?.localizedDescription as Any)
                    onCompletion([])
                }
            }
        }
    }
}
