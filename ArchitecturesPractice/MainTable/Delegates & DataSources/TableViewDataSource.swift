//
//  TableViewDataSource.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    fileprivate let architectures = Architecture.allArchitectures
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return architectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellName) as? CustomTableViewCell {
            
            cell.setupWith(architectures[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}


