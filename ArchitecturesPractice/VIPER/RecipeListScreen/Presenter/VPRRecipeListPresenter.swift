//
//  VPRRecipeListPresenter.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

class VPRRecipeListPresenter: VPRRecipeListPresenterInterface {
    
    weak var view: VPRRecipeListViewInterface?
    var interactor: VPRRecipeListInteractorInterface?
    var router: VPRRecipeListRouterInterface?
    
    func didTapRecipe() {
        // show loading hud status
    }
    
    func viewDidLoad() {
        interactor?.loadRecipesData()
    }
}

extension VPRRecipeListPresenter: VPRRecipeListInteractorOutput {
    func didLoadRecipes(_ recipes: [VPRRecipeListItem]) {
        view?.showPosts(with: recipes)
    }
    
}
