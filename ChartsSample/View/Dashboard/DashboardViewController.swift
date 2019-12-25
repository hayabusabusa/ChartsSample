//
//  DashboardViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class DashboardViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupNavigation() {
        navigationItem.title = "ボード"
    }
}
