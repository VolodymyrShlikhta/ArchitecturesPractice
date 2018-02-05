//
//  RecipeListRouter.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class VPRRecipeListRouter: VPRRecipeListRouterInterface {
    
    var assembly: VPRRecipeListAssemblyInterface!
    
    func showDetails(forRecipe recipe: Recipe) {
        // initialize next router with assebly with recipe and router
    }
    
    func start(in controller: UINavigationController) {
        let listController = VPRRecipeListAssembly.createPostListModule(with: self)
        
        controller.pushViewController(listController, animated: true)
    }
}



