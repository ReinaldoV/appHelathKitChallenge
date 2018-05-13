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
        self.navigationController.viewControllers = [viewController]
    }
    
}
