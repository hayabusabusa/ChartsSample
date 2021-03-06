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
        tableView.rx.itemSelected.asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [weak self] in self?.tableView.deselectRow(at: $0, animated: true) })
            .disposed(by: disposeBag)
    }
}

// MARK: - ViewModel

extension SettingViewController {
    
    private func bindViewModel() {
        viewModel = SettingViewModel()
        
        let dataSource = SettingDataSource()
        let logoutAlert = Alert.present(in: self, title: nil, message: "ログアウトします。\nよろしいですか？", style: .alert, actions: [.ok])
        
        let input = SettingViewModel.Input(selectedRow: tableView.rx.itemSelected.asDriver(),
                                           logoutAlertOk: logoutAlert.asDriver(onErrorDriveWith: .empty()))
        let output = viewModel.transform(input: input)
        
        output.settingsDriver
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        output.replaceRootToLogin
            .drive(onNext: { [weak self] in self?.replaceRootToLogin() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension SettingViewController {
    
    private func replaceRootToLogin() {
        let vc = LoginViewController.instantiate()
        replaceRoot(to: vc)
    }
}
