//
//  RecipeListScreenProtocols.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit


// ROUTER -> Assembly
protocol VPRRecipeListAssemblyInterface: class {
    static func createPostListModule(with router: VPRRecipeListRouterInterface) -> UIViewController
}

// PRESENTER -> Router
protocol VPRRecipeListRouterInterface: class {
    func showDetails(forRecipe recipe: Recipe)
}

// VIEW -> Presenter
protocol VPRRecipeListPresenterInterface {
    func didTapRecipe()
    func viewDidLoad()
}

// PRESENTER -> VIEW
protocol VPRRecipeListViewInterface: class {
    var presenter: VPRRecipeListPresenterInterface? { get set }
    
    func showPosts(with recipes: [VPRRecipeListItem])
    
}

// PRESENTER -> Interactor
protocol VPRRecipeListInteractorInterface {
    func loadRecipesData()
}

// INTERACTOR -> PRESENTER

protocol VPRRecipeListInteractorOutput: class {
    func didLoadRecipes(_ recipes: [VPRRecipeListItem])
}
















