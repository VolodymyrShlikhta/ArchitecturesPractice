//
//  Architecture.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/17/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation


enum Architecture: String {
    case MVC
    case MVP
    case MVVM
    case VIPER
}

extension Architecture {
    static var allArchitectures: [Architecture] {
        var architectures: [Architecture]  = []
        
        switch Architecture.MVC {
            case .MVC: architectures.append(.MVC); fallthrough
            case .MVP: architectures.append(.MVP); fallthrough
            case .MVVM: architectures.append(.MVVM); fallthrough
            case .VIPER: architectures.append(.VIPER)
        }
        return architectures
    }
}
