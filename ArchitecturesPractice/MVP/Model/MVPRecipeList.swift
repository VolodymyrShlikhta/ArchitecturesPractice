//
//  MVPRecipeList.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/22/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit


class MVPRecipeList: MVCRecipeList {
    
    static var recipes: [Recipe] = {
        var recipes = [Recipe]()
        var numberOfItems = MVCRecipeList.shared.numberOfItems()
        var index: Int = 0
        while index < numberOfItems {
            recipes.append(MVCRecipeList.shared.item(at: index))
            index += 1
        }
        
        return recipes
    }()
}
