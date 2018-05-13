//
//  AppCordinator.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        self.showObjectiveListViewController()
    }
    
    private func showObjectiveListViewController() {
        let interactor = ObjectiveListInteractor()
        let presenter = ObjectiveListPresenter(interactor: interactor)
        let viewController = ObjectiveListViewController.instantiate(presenter: presenter)
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    private func showObjectiveDetailViewController(objective: Objective) {
        let presenter = ObjectiveDetailPresenter(objective: objective)
        let viewController = ObjectiveDetailViewController.instantiate(presenter: presenter)
        self.navigationController.show(viewController, sender: self.navigationController)
    }
    
}

extension AppCoordinator: ObjectiveListViewControllerDelegate {
    func didTapOnObjective(objective: Objective) {
        self.showObjectiveDetailViewController(objective: objective)
    }
}
