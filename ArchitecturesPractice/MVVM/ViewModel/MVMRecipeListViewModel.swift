//
//  MVMRecipeListViewModel.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/24/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


class MVMRecipeDisplayItem {
    let image: UIImage
    let title: String
    let description: String
    var isStarred: Bool
    
    
    init(image: UIImage, title: String, description: String, isStarred: Bool) {
        self.image = image
        self.title = title
        self.description = description
        self.isStarred = isStarred
    }
}

class MVMRecipeListViewModel {
    fileprivate(set) var displayItems = Variable<[MVMRecipeDisplayItem]>([])
    
    init(with model: MVMRecipeList) {
        for recipe in model.recipes {
            
            let displayItem = MVMRecipeDisplayItem(image: recipe.image,
                                                   title: recipe.title,
                                                   description: recipe.description,
                                                   isStarred: recipe.isStarred)
            displayItems.value.append(displayItem)
        }
    }
    
    func changeFavoriteFlag(forItemAt index: Int) {
        let recipe = displayItems.value[index]
        displayItems.value[index] = MVMRecipeDisplayItem(image: recipe.image, title: recipe.title, description: recipe.description, isStarred: !recipe.isStarred)
    }
    
}
