//
//  RecipeDetailsViewController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import UIKit

protocol RecipeDetailsControllerDelegate: class {
    func didTapCloseButton()
}

class RecipeDetailsViewController: UIViewController {

    // MARK: Vars
    
    fileprivate let recipe: RecipeDetailsPayload
    weak var delegate: RecipeDetailsControllerDelegate?
    
    // MARK: Initializers
    
    init(withRecipe recipe: RecipeDetailsPayload) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipeView = UINib(nibName: "RecipeDetails", bundle: nil).instantiate(withOwner: self, options: nil).first as! RecipeDetailsView
        recipeView.frame = self.view.frame
        recipeView.setupWith(title: recipe.title,
                             description: recipe.description,
                             image: recipe.image,
                             isStarred: recipe.isStarred)
        recipeView.delegate = self
        self.view.addSubview(recipeView)
    }
    
}

extension RecipeDetailsViewController: RecipeDetailsViewDelegate {
    func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
    
    func didTapStar(flag: Bool) {
        RecipeList.shared.changeIsFavorite(flag, forItemWithUuid: recipe.uuid)
    }
}
