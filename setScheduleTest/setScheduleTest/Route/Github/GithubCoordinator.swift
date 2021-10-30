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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        vc.viewModel = SearchViewModel()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func showUserProfileController() {
        // Not Implemented Yet
    }
}
