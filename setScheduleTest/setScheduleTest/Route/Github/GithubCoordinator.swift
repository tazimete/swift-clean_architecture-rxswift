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
        let vc = SearchViewController(viewModel: SearchViewModel())
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    public func showDetailsController(movie: Movie) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        let vc = DetailsViewController.instantiate(viewModel: SearchViewModel())
        vc.movie = movie
        self.navigationController.pushViewController(vc, animated: true)
    }
}
