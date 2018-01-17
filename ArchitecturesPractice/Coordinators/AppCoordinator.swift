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
        showMainController()
    }
    
    private func showMainController() {
        let mainViewController = TableViewController(TableViewDelegate(tapDelegate: self), TableViewDataSource())
        
        self.navigationController.setViewControllers([mainViewController], animated: true)
    }
    
}

extension AppCoordinator: SelectedRowDelegate {
    func didTapRow(withArchitecture architecture: Architecture) {
        var coordinator: RootViewCoordinator
        switch architecture {
        case .MVC:
            coordinator = MVCCoordinator()
        case .MVP:
            coordinator = MVCCoordinator()
        case .MVVM:
            coordinator = MVCCoordinator()
        case .VIPER:
            coordinator = MVCCoordinator()
        }
        
        coordinator.start()
        self.addChildCoordinator(childCoordinator: coordinator)
        self.rootViewController.present(coordinator.rootViewController, animated: true, completion: nil)
    }
}

extension AppCoordinator: MVCCoordinatorOutput {
    func didTapBack() {
        print("tapped back")
    }
}

