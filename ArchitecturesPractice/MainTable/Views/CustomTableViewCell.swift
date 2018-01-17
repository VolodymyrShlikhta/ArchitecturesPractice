//
//  CustomTableViewCell.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Methods
    
    func setupWith(_ architecture: Architecture) {
        titleLabel.text = architecture.rawValue
    }
    
}
