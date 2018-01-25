//
//  DishesTableViewController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/19/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import UIKit

class MVCRecipesViewController: UIViewController {
    
    // MARK: Vars
    
    weak var delegate: MVCRecipesCoordiantorDelegate?
    var mainView: RecipeListView!
    
    // MARK: Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.starredCounterLabel.text = "Items starred: \(MVCRecipeList.shared.countStarredRecipes())"
    }
    
    // MARK: Methods
    
    fileprivate func setupMainView() {
        mainView = UINib(nibName: "RecipesList", bundle: nil).instantiate(withOwner: self, options: nil).first as! RecipeListView
        mainView.frame = self.view.frame
        
        let topGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTopRecipe))
        let botGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBotRecipe))
        
        mainView.topRecipeImageView.addGestureRecognizer(topGesturerecognizer)
        mainView.botRecipeImageView.addGestureRecognizer(botGesturerecognizer)
        
        self.view.addSubview(mainView)
    }
    
    // MARK: Selectors
    
    @objc func didTapTopRecipe() {
        delegate?.didTapTopRecipe()
    }
    
    @objc func didTapBotRecipe() {
        delegate?.didTapBotRecipe()
    }
}

