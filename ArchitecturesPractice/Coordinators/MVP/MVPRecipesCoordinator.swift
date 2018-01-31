//
//  MVPRecipesCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/22/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVPRecipesCoordinatorDelegate: class {
    func didRequestRecipesDismiss(forRecipesCoordinator coordinator: MVPRecipesCoordinator)
}

class MVPRecipesCoordinator: RootViewCoordinator {
    
    // MARK: Vars
    
    private lazy var navigationController: UINavigationController = {
        let navVC = UINavigationController()
       // navVC.navigationBar.isHidden = true
        return navVC
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    fileprivate var recipeList = MVPRecipeList.shared.recipes
    weak var delegate: MVPRecipesCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    
    // MARK: Methods
    
    func start() {
        let vc = MVPRecipesViewController()
        vc.presenter = RecipesPresenter(with: recipeList, and: vc)
        vc.delegate = self
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    fileprivate func startDetailsCoordinator(withRecipe recipe: Recipe) {
        let coordinator = MVPRecipeDetailsCoordinator(withRecipe: recipe)
        coordinator.delegate = self
        self.addChildCoordinator(childCoordinator: coordinator)
        self.rootViewController.present(coordinator.rootViewController, animated: true, completion: nil)
        coordinator.start()
    }
    
}

extension MVPRecipesCoordinator: MVPRecipesControllerDelegate {
    func didRequestRecipesControllerDismiss() {
        delegate?.didRequestRecipesDismiss(forRecipesCoordinator: self)
    }
    
    func didTapRecipe(withPosition position: RecipePostion) {
        switch position {
        case .TOP:
            startDetailsCoordinator(withRecipe: MVPRecipeList.shared.item(at: 0))
        case .BOT:
            startDetailsCoordinator(withRecipe: MVPRecipeList.shared.item(at: 1))
        }
    }
}

extension MVPRecipesCoordinator: MVPRecipeDetailsCoordinatorDelegate {
    func recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: MVPRecipeDetailsCoordinator) {
        detailsCoordinator.rootViewController.dismiss(animated: true, completion: nil)
        self.removeChildCoordinator(childCoordinator: detailsCoordinator)
    }
}
