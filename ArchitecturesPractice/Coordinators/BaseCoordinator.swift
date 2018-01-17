//
//  BaseCoordinator.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
}

protocol BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { set get }
}

extension BaseCoordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
