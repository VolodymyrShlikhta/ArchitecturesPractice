//
//  AppCoordinator.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: RootViewCoordinator {
    
    // MARK: Vars
    
    let window: UIWindow
    private lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    var childCoordinators: [Coordinator] = []
    
    // MARK: Initializers
    
    init(with window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: Methods
    
    func start() {
        let mainViewController = TableViewController(TableViewDelegate(tapDelegate: self), TableViewDataSource())
        
        self.navigationController.pushViewController(mainViewController, animated: false)
    }
    
    fileprivate func present(_ coordinator: RootViewCoordinator) {
        coordinator.start()
        
        self.addChildCoordinator(childCoordinator: coordinator)
        self.rootViewController.present(coordinator.rootViewController, animated: true, completion: nil)
    }
    
    fileprivate func dismiss(coordinator: RootViewCoordinator) {
        coordinator.rootViewController.dismiss(animated: true, completion: nil)
        self.removeChildCoordinator(childCoordinator: coordinator)
    }
    
}

extension AppCoordinator: SelectedRowDelegate {
    func didTapRow(withArchitecture architecture: Architecture) {
        switch architecture {
        case .MVC:
            let coordinator = MVCRecipesCoordiantor()
            coordinator.delegate = self
            present(coordinator)
        case .MVP:
            let coordinator = MVPRecipesCoordinator()
            coordinator.delegate = self
            present(coordinator)
        case .MVVM:
            let coordinator = MVMRecipesCoordinator()
            coordinator.delegate = self
            present(coordinator)
        case .VIPER:
            let coordinator = VPRRecipeListCoordinator()
            present(coordinator)
        }
        
        
    }
}

extension AppCoordinator: MVCRecipesCoordinatorDelegate {
    func didRequestDismiss(forRecipesCoordinator coordinator: MVCRecipesCoordiantor) {
        dismiss(coordinator: coordinator)
    }
    
}

extension AppCoordinator: MVPRecipesCoordinatorDelegate {
    func didRequestRecipesDismiss(forRecipesCoordinator coordinator: MVPRecipesCoordinator) {
        dismiss(coordinator: coordinator)
    }
}

extension AppCoordinator: MVMRecipesCoordinatorDelegate {
    func didRequestRecipesCoordinatorDismiss(forRecipesCoordinator coordinator: MVMRecipesCoordinator) {
        dismiss(coordinator: coordinator)
    }
    
    
}

