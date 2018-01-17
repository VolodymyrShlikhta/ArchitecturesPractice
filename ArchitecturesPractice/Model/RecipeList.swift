//
//  File.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/17/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class RecipeList {
    
    // MARK: Definitions
    
    struct Recipe {
        let image: UIImage
        let title: String
        fileprivate(set) var isFavorite: Bool
    }
    
    // MARK: Vars
    
    fileprivate var recipes = [Recipe]()
    
    // MARK: Initializers
    
    init() {
        var index = 1
        let recipeNames = ["Soup", "Pie"]
        for name in recipeNames {
            recipes.append(.init(image: UIImage(named: "r\(index)")!,
                                 title: name,
                                 isFavorite: false))
            index += 1
        }
    }
    
    // MARK: Methods
    
    func numberOfItems() -> Int {
        return recipes.count
    }
    
    func item(at index: Int) -> Recipe {
        return recipes[index]
    }
    
    func changeIsFavorite(_ flag: Bool, forItemAt index: Int) {
        var recipe = item(at: index)
        recipe.isFavorite = flag
        recipes[index] = recipe
    }
}
