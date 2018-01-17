//
//  TableViewDelegate.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

protocol SelectedRowDelegate: class {
    func didTapRow(withArchitecture architecture: Architecture)
}

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    // MARK: Vars
    
    weak var cellTapDelegate: SelectedRowDelegate?
    
    // MARK: Initializers
    
    init(tapDelegate delegate: SelectedRowDelegate) {
        self.cellTapDelegate = delegate
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTapDelegate?.didTapRow(withArchitecture: Architecture.allArchitectures[indexPath.row])
    }
}
