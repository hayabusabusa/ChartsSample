//
//  SettingViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa


final class SettingViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    private var viewModel: SettingViewModel!
    
    // MARK: Lifecycle
    
    static func instantiate() -> SettingViewController {
        return Storyboard.SettingViewController.instantiate(SettingViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        bindViewModel()
    }
}

// MARK: - Setup

extension SettingViewController {
    
    private func setupNavigation() {
        navigationItem.title = "設定"
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = SettingListCell.rowHeight
        tableView.register(SettingListCell.nib, forCellReuseIdentifier: SettingListCell.reuseIdentifier)
    }
}

// MARK: - ViewModel

extension SettingViewController {
    
    private func bindViewModel() {
        viewModel = SettingViewModel()
        
        let output = viewModel.transform(input: SettingViewModel.Input())
        
        output.settingsDriver
            .drive(tableView.rx.items(cellIdentifier: SettingListCell.reuseIdentifier, cellType: SettingListCell.self)) { index, item, cell  in
                switch item {
                case .normal(let title):
                    cell.setupCell(title: title, status: nil)
                case let .withStatus(title, status):
                    cell.setupCell(title: title, status: status)
                }
        }
        .disposed(by: disposeBag)
    }
}
