//
//  MVCCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVCRecipesCoordinatorDelegate: class {
    func didRequestDismiss(forRecipesCoordinator coordinator: MVCRecipesCoordiantor)
}

class MVCRecipesCoordiantor: RootViewCoordinator {
    
    // MARK: Vars
    
   private lazy var navigationController: UINavigationController = {
        let navVC = UINavigationController()
        //navVC.isNavigationBarHidden = true
        return navVC
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    var childCoordinators: [Coordinator] = []
    weak var delegate: MVCRecipesCoordinatorDelegate?
    // MARK: Methods
    
    func start() {
        let recipesVC = MVCRecipesViewController()
        recipesVC.delegate = self
        self.navigationController.pushViewController(recipesVC, animated: false)
    }
    
    fileprivate func startRecipeDetailsCoordinator(_ recipePayload: MVCRecipeDetailsPayload) {
        let detailsCoordinator = MVCRecipeDetailsCoordinator(withRecipe: recipePayload)
        detailsCoordinator.start()
        detailsCoordinator.delegate = self
        self.rootViewController.present(detailsCoordinator.rootViewController, animated: true, completion: nil)
        self.addChildCoordinator(childCoordinator: detailsCoordinator)
    }
    
}

extension MVCRecipesCoordiantor: MVCRecipesCoontrollerDelegate {
    func didTapTopRecipe() {
        let recipePayload = MVCRecipeList.shared.item(at: 0)
        startRecipeDetailsCoordinator(recipePayload)
    }
    
    func didTapBotRecipe() {
        let recipePayload = MVCRecipeList.shared.item(at: 1)
        startRecipeDetailsCoordinator(recipePayload)
    }
    
}

extension MVCRecipesCoordiantor: MVCRecipeDetailsCoordinatorDelegate {
    func recipeDetailsCoordinatorDidRequestDismiss(detailsCoordinator: MVCRecipeDetailsCoordinator) {
        detailsCoordinator.rootViewController.dismiss(animated: true, completion: nil)
        self.removeChildCoordinator(childCoordinator: detailsCoordinator)
    }
}


extension MVCRecipesCoordiantor: RecipesControllerDismissDelegate {
    func didRequestRecipesControllerDismiss() {
        delegate?.didRequestDismiss(forRecipesCoordinator: self)
    }
}

