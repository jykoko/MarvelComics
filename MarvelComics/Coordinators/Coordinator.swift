//
//  Coordinator.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import UIKit.UINavigationController

/// A protocol defined to provide a common interface for navigation flows
/// Coordinators allow us to encapsulate navigation flow logic, abstracting it away from the ViewControllers
protocol Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    // MARK: - Methods
    
    func start()
}
