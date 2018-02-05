//
//  RecipeListAssembly.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class VPRRecipeListAssembly: VPRRecipeListAssemblyInterface {
    class func createPostListModule(with router: VPRRecipeListRouterInterface) -> UIViewController {
        let listController = VPRRecipeListView()
        let presenter = VPRRecipeListPresenter()
        let interactor = VPRRecipeListInteractor()
        
        presenter.view = listController
        presenter.interactor = interactor
        presenter.router = router
        listController.presenter = presenter
        //listController.eventsHandler = presenter
        interactor.presenter = presenter
        return listController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "", bundle: nil)
    }
}
