//
//  VPRRecipeListCoordinator.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit


class VPRRecipeListCoordinator: RootViewCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController = {
        let navVC = UINavigationController()
        return navVC
    }()
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    func start() {
        let viper = VPRRecipeListRouter()
        viper.assembly = VPRRecipeListAssembly()
        viper.start(in: navigationController)
    }
    
    
}
