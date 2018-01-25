//
//  MVCRecipeDetailsCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVCRecipeDetailsCoordinatorDelegate: class {
    func recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: MVCRecipeDetailsCoordinator)
}

class MVCRecipeDetailsCoordinator: RootViewCoordinator {
    
    // MARK: Vars
    
    private lazy var navigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.isNavigationBarHidden = true
        return navVC
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    var childCoordinators: [Coordinator] = []
    var recipe: MVCRecipeDetailsPayload
    weak var delegate: MVCRecipeDetailsCoordinatorDelegate?
    
    // MARK: Initializers
    
    init(withRecipe payload: MVCRecipeDetailsPayload) {
        self.recipe = payload
    }
    
    // MARK: Methods
    
    func start() {
        let detailsVC = MVCRecipeDetailsViewController(withRecipe: recipe)
        detailsVC.delegate = self
        self.navigationController.pushViewController(detailsVC, animated: false)
    }
    
}

extension MVCRecipeDetailsCoordinator: RecipeDetailsControllerDelegate {
    func didTapCloseButton() {
        delegate?.recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: self)
    }
}
