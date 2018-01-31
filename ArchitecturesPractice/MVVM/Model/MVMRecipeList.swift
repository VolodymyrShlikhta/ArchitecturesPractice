//
//  MVMRecipeList.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/24/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit



class MVMRecipeList {
    
    // MARK: Vars
    
    fileprivate(set) var recipes = [Recipe]()
    
    // MARK: Initializers
    
    init() {
        var index = 1
        let recipeNames = ["Soup", "Pie"]
        for name in recipeNames {
            recipes.append(.init(image: UIImage(named: "r\(index)")!,
                                 title: name,
                                 description: "Hello, there",
                                 isStarred: false,
                                 uuid: UUID.init()))
            index += 1
        }
    }
    
    // MARK: Methods
    
    func numberOfItems() -> Int {
        return recipes.count
    }
    
    func item(at index: Int) -> Recipe {
        return recipes[index]
    }
    
    func item(withUUID uuid: UUID) -> Recipe {
        return recipes.filter({ $0.uuid == uuid }).first!
    }
    
    func changeIsFavorite(_ flag: Bool, forItemWithUuid uuid: UUID) {
        item(withUUID: uuid).isStarred = flag
    }
    
    func countStarredRecipes() -> Int {
        return recipes.reduce(into: Int(0)) { (result, payload) in
            result += payload.isStarred ? 1 : 0
        }
    }
}
