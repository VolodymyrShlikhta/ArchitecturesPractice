//
//  MVPRecipeDetailsCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/22/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVPRecipeDetailsCoordinatorDelegate: class {
    func recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: MVPRecipeDetailsCoordinator)
}

class MVPRecipeDetailsCoordinator: RootViewCoordinator {
    
    // MARK: Vars
    
    private lazy var navigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.isHidden = true
        return navVC
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    fileprivate var recipe: Recipe
    var childCoordinators: [Coordinator] = []
    var delegate: MVPRecipeDetailsCoordinatorDelegate?
    
    // MARK: Initializers
    
    init(withRecipe recipe: Recipe) {
        self.recipe = recipe
    }
    
    // MARK: Methods
    
    func start() {
        let vc = MVPRecipeDetailsViewController()
        vc.delegate = self
        vc.presenter = RecipeDetailsPresenter(with: recipe, and: vc)
        self.navigationController.pushViewController(vc, animated: false)
    }
    
}

extension MVPRecipeDetailsCoordinator: MVPRecipeDetailsControllerDelegate {
    func didTapCloseButton() {
        delegate?.recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: self)
    }
}
