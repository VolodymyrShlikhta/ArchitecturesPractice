//
//  MVMRecipeListViewController.swift
//  ArchitecturesPractice
//
//  Created by Volodymyr Shlikhta on 1/24/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol MVMRecipeListControllerDelegate: class {
    func didRequestDismiss()
}

class MVMRecipeListViewController: UIViewController {
    
    // MARK: Vars
    
    var viewModel: MVMRecipeListViewModel!
    private var myTableView: UITableView!
    var bag: DisposeBag = DisposeBag()
    weak var delegate: MVMRecipeListControllerDelegate?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "MVVM"
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapBack))
        self.navigationItem.setLeftBarButton(backButton, animated: false)
        setupTableView()
        setupViewModel()
        setupCellConfigurating()
        setupCellTapHandling()
    }
    
    // MARK: Methods
    
    fileprivate func setupViewModel() {
        let model = MVMRecipeList()
        viewModel = MVMRecipeListViewModel(with: model)
        viewModel.displayItems.asObservable().subscribe(onNext: { [weak self] value in
            self?.myTableView.reloadData()
        })
        .disposed(by: bag)
    }
    
    fileprivate func setupTableView() {
        myTableView = UITableView(frame: UIScreen.main.bounds)
        self.view.addSubview(myTableView)
        let nib = UINib(nibName: Constants.recipeTableViewCellName, bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: Constants.recipeTableCellReuseId)
        
    }
    
    fileprivate func setupCellConfigurating() {
        // populate cells aka cellforrow
        viewModel
            .displayItems
            .asObservable()
            .bind(to: myTableView
                .rx
                .items(cellIdentifier: Constants.recipeTableCellReuseId,
                       cellType: RecipeTableViewCell.self)) { [weak self] row, item, cell in
                    cell.setupWith(title: item.title, isStarred: item.isStarred)
                    cell.delegate = self
            }
            .disposed(by: bag)
    }
    
    fileprivate func setupCellTapHandling() {
        myTableView
            .rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                let recipe = self.viewModel.displayItems.value[indexPath.row]
                let detailsVC = MVMRecipeDetailsViewController(withRecipe: recipe, forIndexPath: indexPath)
                detailsVC.delegate = self
                self.navigationController?.pushViewController(detailsVC, animated: true)
            })
            .disposed(by: bag)
    }
    
    // MARK: Actions
    
    @objc func didTapBack() {
        delegate?.didRequestDismiss()
    }
}

// delegated tap from details controller
extension MVMRecipeListViewController: MVMRecipeDetailsControllerDelegate {
    func recipeDetails(controller: MVMRecipeDetailsViewController) {
        viewModel.changeFavoriteFlag(forItemAt: controller.indexPath.row)
    }
}

// delegated taps from cellview
extension MVMRecipeListViewController: MVMRecipeTableViewCellDelegate {
    // if cell star is tapped
    func recipeCell(_ cell: RecipeTableViewCell, didChangeFavorite flag: Bool) {
        if let indexPath = myTableView.indexPath(for: cell) {
            viewModel.changeFavoriteFlag(forItemAt: indexPath.row)
        }
    }
    
}
