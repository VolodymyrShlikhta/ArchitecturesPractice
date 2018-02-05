//
//  VPRRecipeList.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 2/5/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

class VPRRecipeList: MVMRecipeList {
    func changeIsFavorite(to flag: Bool, forItemAt index: Int) {
        self.recipes[index].isStarred = flag
    }
}
