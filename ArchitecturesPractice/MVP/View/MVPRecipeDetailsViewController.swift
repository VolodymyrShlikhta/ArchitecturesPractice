//
//  MVPRecipeDetailsController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/23/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVPRecipeDetailsControllerDelegate {
    func didTapCloseButton()
}

class MVPRecipeDetailsViewController: UIViewController {
    
    // MARK: Vars
    
    var mainView: RecipeDetailsView!
    var presenter: RecipeDetailsPresenter!
    fileprivate var recipe: PresentableRecipe!
    var delegate: MVPRecipeDetailsControllerDelegate?

    // MARK: View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadData()
    }
    
}

extension MVPRecipeDetailsViewController: MVPDetailsViewInterface {

    func show(recipe: PresentableRecipe) {
        let recipeView = UINib(nibName: "RecipeDetails", bundle: nil).instantiate(withOwner: self, options: nil).first as! RecipeDetailsView
        recipeView.frame = self.view.frame
        recipeView.setupWith(title: recipe.title,
                             description: recipe.description,
                             image: recipe.image,
                             isStarred: recipe.isStarred)
        recipeView.delegate = self
        self.view.addSubview(recipeView)
    }
}

extension MVPRecipeDetailsViewController: RecipeDetailsViewDelegate {
    func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
    
    func didTapStar(flag: Bool) {
        presenter.didStarRecipe(withFlag: flag)
    }
}
