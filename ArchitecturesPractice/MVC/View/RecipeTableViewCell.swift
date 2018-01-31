//
//  RecipeDetailsTableViewCell.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/30/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVMRecipeTableViewCellDelegate: class {
    func recipeCell(_ cell: RecipeTableViewCell, didChangeFavorite flag: Bool)
}

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: Outlets & Actions
    
    @IBOutlet weak var starredButton: UIButton! {
        didSet {
            let image = starredButton.image(for: .normal)
            starredButton.setImage(image?.withRenderingMode(.alwaysTemplate),
                                      for: .normal)
        }
    }
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBAction func didTapFavoriteButton(_ sender: Any) {
        delegate?.recipeCell(self,
                             didChangeFavorite: !isStarred)
    }
    
    // MARK: Vars
    
    weak var delegate: MVMRecipeTableViewCellDelegate?
    
    fileprivate var isStarred: Bool = false {
        didSet {
            starredButton.tintColor = isStarred ? .red : .gray
        }
    }
    
    // MARK: Methods
    
    func setupWith(title: String, isStarred: Bool) {
        recipeNameLabel.text = title
        self.isStarred = isStarred
    }
    
}
