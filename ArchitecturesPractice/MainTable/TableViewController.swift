//
//  ViewController.swift
//  MVPExample
//
//  Created by Volodymyr Shlikhta on 1/11/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: Vars
    
    private var myTableView: UITableView!
    private var delegate: UITableViewDelegate
    private var dataSource: UITableViewDataSource
    
    // MARK: Initializers
    
    init(_ delegate: TableViewDelegate,_ dataSource: TableViewDataSource ) {
        self.delegate = delegate
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Architectures"
        setupTableView()
    }

    // MARK: Methods
    
    fileprivate func setupTableView() {
        myTableView = UITableView(frame: UIScreen.main.bounds)
        myTableView.delegate = self.delegate
        myTableView.dataSource = self.dataSource
        self.view.addSubview(myTableView)
        
        myTableView.register(UINib(nibName: Constants.tableCellNibName, bundle: nil),
                             forCellReuseIdentifier: Constants.tableViewCellName)
        
    }
   

}

