//
//  RootViewCoordinator.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol RootViewControllerProvider: class {
    var rootViewController: UIViewController { get }
}

typealias RootViewCoordinator = BaseCoordinator & RootViewControllerProvider
