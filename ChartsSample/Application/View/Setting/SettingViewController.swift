//
//  SettingViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> SettingViewController {
        return Storyboard.SettingViewController.instantiate(SettingViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
    }
}

extension SettingViewController {
    
    private func setupNavigation() {
        navigationItem.title = "設定"
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(SettingListCell.nib, forCellReuseIdentifier: SettingListCell.reuseIdentifier)
    }
}
