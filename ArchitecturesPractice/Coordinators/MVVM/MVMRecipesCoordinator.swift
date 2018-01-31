//
//  MVMRecipesCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/29/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVMRecipesCoordinatorDelegate: class {
    func didRequestRecipesCoordinatorDismiss(forRecipesCoordinator coordinator: MVMRecipesCoordinator)
}

class MVMRecipesCoordinator: RootViewCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.isToolbarHidden = false
        return navVC
    }()
    
    var childCoordinators = [Coordinator]()
    weak var delegate: MVMRecipesCoordinatorDelegate?
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    func start() {
        let recipesController = MVMRecipeListViewController()
        recipesController.delegate = self
        self.navigationController.pushViewController(recipesController, animated: false)
    }
    
    
}

extension MVMRecipesCoordinator: MVMRecipeListControllerDelegate {
    func didRequestDismiss() {
        delegate?.didRequestRecipesCoordinatorDismiss(forRecipesCoordinator: self)
    }
}
