//
//  DashboardViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DashboardViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secondContainer: UIView!
    
    // MARK: Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupChild()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupNavigation() {
        navigationItem.title = "Dashboard"
    }
    
    private func setupChild() {
        let barChart = BarChartViewController.instantiate()
        embed(barChart, to: firstContainer)
    }
}
