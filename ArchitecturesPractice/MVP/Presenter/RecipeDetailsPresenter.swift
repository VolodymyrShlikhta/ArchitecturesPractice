//
//  RecipeDetailsPresenter.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/23/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

struct MVPPresentableRecipe {
    var image: UIImage
    var title: String
    var description: String
    var isStarred: Bool
}

protocol MVPDetailsViewInterface: class {
    func show(recipe: MVPPresentableRecipe)
}

class RecipeDetailsPresenter {
    
    // MARK: Vars
    
    var model: Recipe
    fileprivate var recipe: MVPPresentableRecipe!
    unowned let view: MVPDetailsViewInterface
    
    // MARK: Initializers
    
    init(with model: Recipe, and view: MVPDetailsViewInterface) {
        self.model = model
        self.view = view
    }
    
    // MARK: Methods
    
    func loadData() {
        recipe = MVPPresentableRecipe(image: model.image,
                                                  title: model.title,
                                                  description: model.description,
                                                  isStarred: model.isStarred)
        view.show(recipe: recipe)
    }
    
    func didStarRecipe(withFlag flag: Bool) {
        MVPRecipeList.shared.changeIsFavorite(flag, forItemWithUuid: model.uuid)
    }
}
