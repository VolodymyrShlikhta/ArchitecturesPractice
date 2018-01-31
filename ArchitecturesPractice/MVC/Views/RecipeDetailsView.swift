//
//  RecipeDetailsView.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeDetailsViewDelegate: class {
    func didTapCloseButton()
    func didTapStar(flag: Bool)
}

class RecipeDetailsView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet weak var recipeDetailsTextView: UITextView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var starButton: UIButton! {
        didSet {
            let image = starButton.image(for: .normal)
            starButton.setImage(image?.withRenderingMode(.alwaysTemplate),
                                      for: .normal)
        }
    }
    
    // MARK: Vars
    
    var uuid: Int?
    weak var delegate: RecipeDetailsViewDelegate?
    fileprivate var isStarred: Bool = false {
        didSet {
            starButton.tintColor = isStarred ? .black : .white
            starButton.layer.cornerRadius = starButton.frame.width / 2
        }
    }
    
    // MARK: Actions
    
    @IBAction func closePressed(_ sender: Any) {
        delegate?.didTapCloseButton()
    }
    
    @IBAction func pressedStar(_ sender: Any) {
        isStarred = !isStarred
        delegate?.didTapStar(flag: isStarred)
    }
    
    // MARK: Methods
    
    func setupWith(title: String, description: String, image: UIImage, isStarred: Bool) {
        recipeDetailsTextView.text = description
        recipeTitleLabel.text = title
        recipeImageView.image = image
        self.isStarred = isStarred
    }
}
