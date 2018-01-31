//
//  File.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/17/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol MVCRecipeDetailsPayload {
    var image: UIImage {get set}
    var title: String {get set}
    var description: String {get set}
    var isStarred: Bool {get set}
    var uuid: UUID {get set}
}

class Recipe: MVCRecipeDetailsPayload {
    
    var image: UIImage
    var title: String
    var description: String
    var isStarred: Bool
    var uuid: UUID
    
    init(image: UIImage, title: String, description: String, isStarred: Bool, uuid: UUID) {
        self.image = image
        self.title = title
        self.description = description
        self.isStarred = isStarred
        self.uuid = uuid
    }
}


// Not thread safe, be carefull for race conditions and stuff
class MVCRecipeList {
    
    
    
    // MARK: Vars
    
    static var shared = MVCRecipeList()
    
    fileprivate(set) var recipes = [Recipe]()
    
    // MARK: Initializers
    
    private init() {
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
