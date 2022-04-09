//
//  AppCoordinator.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import UIKit.UINavigationController

/// The main app coordinator is the starting point of the application's navigation flow
final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Navigation

    func start() {
        let comicListViewModel = ComicListViewModel(comicClient: ComicsClient())
        let comicListViewController = ComicListViewController(with: comicListViewModel)
        navigationController.pushViewController(comicListViewController, animated: false)
    }
}
