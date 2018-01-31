//
//  RecipesPresenter.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/22/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

struct MVPRecipeDisplayItem {
    let image: UIImage
    let text: String
}

protocol MVPRecipesViewInterface: class {
    func show(recipes: [MVPRecipeDisplayItem])
    func updateStarredCounterLabel(with value: Int)
}

enum RecipePostion: String {
    case TOP
    case BOT
}

class RecipesPresenter {
    
    // MARK: Vars
    
    var model: [Recipe]
    unowned let view: MVPRecipesViewInterface
    fileprivate var list = [MVPRecipeDisplayItem]()
    
    // MARK: Initializers
    
    init(with model: [Recipe], and view: MVPRecipesViewInterface) {
        self.model = model
        self.view = view
    }
    
    // MARK: Methods
    
    func loadData() {
        // Remap injected model to presentable one
        for r in model {
            let displayItem = MVPRecipeDisplayItem(image: r.image,
                                                   text: r.title)
            list.append(displayItem)
        }
        // call initial setting up for gestures and stuff
        view.show(recipes: list)
        view.updateStarredCounterLabel(with: countStarredInModel())
    }
   
    fileprivate func countStarredInModel() -> Int {
        return MVPRecipeList.shared.countStarredRecipes()
    }
    
}
