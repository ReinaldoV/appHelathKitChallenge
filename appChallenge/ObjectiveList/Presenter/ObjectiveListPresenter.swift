//
//  ObjectiveListPresenter.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class ObjectiveListPresenter: ObjectiveListPresenterProtocol {

    weak var view: ObjectiveListViewProtocol?
    var interactor: ObjectiveListInteractorProtocol
    var objectives: [Objective] = []

    init(interactor: ObjectiveListInteractorProtocol) {
        self.interactor = interactor
    }

    func getObjectives() {
        interactor.getObjectives { (objectives) in
            self.objectives = objectives
            let objectivesViewModel = self.prepareDataForView(objectives: self.objectives)
            self.view?.showObjectiveList(objectivesList: objectivesViewModel)
        }
    }

    private func prepareDataForView(objectives: [Objective]) -> [ObjectiveListViewItemModel] {
        var objectivesViewModel: [ObjectiveListViewItemModel] = []

        for objective in objectives {

            let title = objective.title
            let description = objective.description
            let medalImage = getMedaImage(reward: objective.reward.trophy)
            let isCompleted = objective.progress >= objective.goal

            let objectiveViewModel = ObjectiveListViewItemModel(title: title,
                                                                description: description,
                                                                medalImage: medalImage,
                                                                isCompleted: isCompleted)

            objectivesViewModel.append(objectiveViewModel)
        }

        return objectivesViewModel
    }

    private func getMedaImage(reward: Trophies) -> UIImage {
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
