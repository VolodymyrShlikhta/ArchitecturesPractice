//
//  VPRRecipeListView.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class VPRRecipeListView: UITableViewController, VPRRecipeListViewInterface {
    fileprivate let cellId = "VPRRecipeListCell"
    var presenter: VPRRecipeListPresenterInterface?
    var recipes: [VPRRecipeListItem] = [VPRRecipeListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "VPRRecipeListCell", bundle: nil),
                           forCellReuseIdentifier: cellId)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    func showPosts(with recipes: [VPRRecipeListItem]) {
        self.recipes = recipes
        tableView.reloadData()
    }
}

// MARK: TableViewDataSource
extension VPRRecipeListView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! VPRRecipeListCell
        let recipe = recipes[indexPath.row]
        cell.setupWith(recipeImage: recipe.image, recipeTitle: recipe.title, isStarred: true)
        return cell
    }
}

// MARK: TableViewDelegate
extension VPRRecipeListView {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
