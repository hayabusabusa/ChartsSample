//
//  SCDashboardViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class SCDashboardViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var firstContainer: UIView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> SCDashboardViewController {
        let vc = Storyboard.SCDashboardViewController.instantiate(SCDashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupChild()
    }
}

// MARK: - Setup

extension SCDashboardViewController {
    
    private func setupNavigation() {
        navigationItem.title = "SwiftChart ver"
    }
    
    private func setupChild() {
        let bar = SCBarChartViewController.instantiate()
        embed(bar, to: firstContainer)
    }
}
