//
//  VPRRecipeListInteractor.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

struct VPRRecipeListItem {
    var image: UIImage
    var title: String
}

class VPRRecipeListInteractor: VPRRecipeListInteractorInterface {
    private let model = VPRRecipeList()
    weak var presenter: VPRRecipeListInteractorOutput?

    func loadRecipesData() {
        presenter?.didLoadRecipes(
                model.recipes
                .reduce(into: [VPRRecipeListItem]()) {
                    $0.append(VPRRecipeListItem(image: $1.image,
                                                title: $1.title))
        })
        
    }
    
    func changeIsFavorite(at index: Int, with flag: Bool) {
        model.changeIsFavorite(to: flag, forItemAt: index)
    }
    
}
