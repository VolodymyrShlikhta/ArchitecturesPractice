//
//  MVCCoordinator.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/17/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVCCoordinatorOutput: class {
    func didTapBack()
}

class MVCCoordinator: RootViewCoordinator {
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()

    var childCoordinators: [Coordinator] = []
    
    weak var delegate: MVCCoordinatorOutput?
    
    func start() {
        
    }
    
}
