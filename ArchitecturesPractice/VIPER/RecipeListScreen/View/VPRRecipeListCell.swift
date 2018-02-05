//
//  VPRRecipeListCell.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class VPRRecipeListCell: UITableViewCell {
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var isStarredImageView: UIImageView!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    func setupWith(recipeImage: UIImage, recipeTitle: String, isStarred: Bool){
        self.recipeImageView.image = recipeImage
        self.recipeTitleLabel.text = recipeTitle
    }
}
