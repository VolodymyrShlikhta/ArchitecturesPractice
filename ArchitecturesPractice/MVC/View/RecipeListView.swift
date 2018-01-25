//
//  RecipeListView.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVCRecipesCoordiantorDelegate: class {
    func didTapTopRecipe()
    func didTapBotRecipe()
}

class RecipeListView: UIView {
    
    // MARK: Vars
    
    weak var delegate: MVCRecipesCoordiantorDelegate?
    
    // MARK: Outlets
    
    @IBOutlet weak var topRecipeImageView: UIImageView! {
        didSet {
            topRecipeImageView.clipsToBounds = true
            topRecipeImageView.layer.cornerRadius = topRecipeImageView.frame.width / 3
            topRecipeImageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var botRecipeImageView: UIImageView! {
        didSet {
            botRecipeImageView.clipsToBounds = true
            botRecipeImageView.layer.cornerRadius = botRecipeImageView.frame.width / 3
            botRecipeImageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var starredCounterLabel: UILabel!
    
}
