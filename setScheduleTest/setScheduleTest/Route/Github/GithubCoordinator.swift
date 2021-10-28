//
//  RootCoordinator.swift
//  tawktestios
//
//  Created by JMC on 31/7/21.
//

import UIKit

class GithubCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        // Not Implemented Yet
    }
    
    public func showUserProfileController() {
        // Not Implemented Yet
    }
}
