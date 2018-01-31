//
//  MVMRecipeDetailsViewController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/24/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVMRecipeDetailsControllerDelegate: class {
    func recipeDetails(controller: MVMRecipeDetailsViewController)
}

class MVMRecipeDetailsViewController: UIViewController {
    
    // MARK: Vars
    
    fileprivate let recipe: MVMRecipeDisplayItem
    weak var delegate: MVMRecipeDetailsControllerDelegate?
    var indexPath: IndexPath
    
    // MARK: Initializers
    
    init(withRecipe recipe: MVMRecipeDisplayItem, forIndexPath indexPath: IndexPath) {
        self.recipe = recipe
        self.indexPath = indexPath
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
        self.navigationController?.isToolbarHidden = true
        self.title = "Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
}

extension MVMRecipeDetailsViewController: RecipeDetailsViewDelegate {
    func didTapStar(flag: Bool) {
        delegate?.recipeDetails(controller: self)
    }
    
    func didTapCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
