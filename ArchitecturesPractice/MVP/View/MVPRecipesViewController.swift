//
//  MVPRecipesViewController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/22/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVPRecipesControllerDelegate {
    func didTapRecipe(withPosition position: RecipePostion)
    func didRequestRecipesControllerDismiss()
}

class MVPRecipesViewController: UIViewController {
    
    // MARK: Vars
    
    var mainView: RecipeListView!
    var presenter: RecipesPresenter!
    
    fileprivate var isDataLoaded = false
    fileprivate var displayItems = [MVPRecipeDisplayItem]()
    
    var delegate: MVPRecipesControllerDelegate?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapBack))
        self.navigationItem.setLeftBarButton(backButton, animated: false)
        
        self.navigationController?.navigationBar.topItem?.title = "MVP"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadData()
    }
    
    // MARK: Selectors
    
    @objc func didTapTopRecipe() {
        delegate?.didTapRecipe(withPosition: .TOP)
    }
    
    @objc func didTapBotRecipe() {
        delegate?.didTapRecipe(withPosition: .BOT)
    }
    
    @objc func didTapBack() {
        delegate?.didRequestRecipesControllerDismiss()
    }
}

extension MVPRecipesViewController: MVPRecipesViewInterface {
    
    func show(recipes: [MVPRecipeDisplayItem]) {
        mainView = UINib(nibName: "RecipesList", bundle: nil).instantiate(withOwner: self, options: nil).first as! RecipeListView
        mainView.frame = self.view.frame
        mainView.topRecipeImageView.image = recipes[0].image
        mainView.botRecipeImageView.image = recipes[1].image
        
        let topGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTopRecipe))
        let botGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBotRecipe))
        
        mainView.topRecipeImageView.addGestureRecognizer(topGesturerecognizer)
        mainView.botRecipeImageView.addGestureRecognizer(botGesturerecognizer)
        self.view.addSubview(mainView)
    }
    
    func updateStarredCounterLabel(with value: Int) {
        self.mainView.starredCounterLabel.text = "Items starred:\(value)"
    }
}

