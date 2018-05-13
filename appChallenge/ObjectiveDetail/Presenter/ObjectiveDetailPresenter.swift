//
//  ObjectiveDetailPresenter.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ObjectiveDetailPresenter: ObjectiveDetailPresenterProtocol {
    weak var view: ObjectiveDetailViewProtocol?
    let objective: Objective
    
    init(objective: Objective) {
        self.objective = objective
    }
    
    func getObjectiveInfo() {
        let objectiveInfo = ObjectiveDetailViewModel(title: self.objective.title,
                                                     description: self.objective.description,
                                                     percentage: self.getPercentage(),
                                                     current: self.objective.progress,
                                                     goal: self.objective.goal,
                                                     throphyImage: getThropyImage(reward: self.objective.reward.trophy),
                                                     isCompleted: self.objective.progress/self.objective.goal >= 1)
        view?.refreshObjective(objective: objectiveInfo)
    }
    
    private func getPercentage() -> String {
        var percentage = self.objective.progress/self.objective.goal
        if percentage > 1 {
            percentage = 1
        }
        percentage = percentage * 100
        return String(format: "%.f", percentage)
    }
    
    private func getThropyImage(reward: Trophies) -> UIImage {
        var medalImage = UIImage()
        switch reward {
        case .bronzeMedal:
            if let image = UIImage(named: "bronzeMedal") {
                medalImage = image
            }
        case .silverMedal:
            if let image = UIImage(named: "silverMedal") {
                medalImage = image
            }
        case .goldMedal:
            if let image = UIImage(named: "goldMedal") {
                medalImage = image
            }
        case .zombiesHand:
            if let image = UIImage(named: "zombieHand") {
                medalImage = image
            }
        }
        return medalImage
    }
}
