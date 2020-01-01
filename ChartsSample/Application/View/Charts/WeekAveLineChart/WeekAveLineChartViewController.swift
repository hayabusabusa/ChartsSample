//
//  WeekAveLineChartViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa
import Charts

final class WeekAveLineChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var lineChartView: LineChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func configureWith(studiesDriver: Driver<[Study]>) -> WeekAveLineChartViewController {
        let vc = Storyboard.WeekAveLineChartViewController.instantiate(WeekAveLineChartViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension WeekAveLineChartViewController {
    
    private func setupChartView() {
        lineChartView.noDataFont = .boldSystemFont(ofSize: 14)
        lineChartView.noDataText = "データがありません"
        lineChartView.noDataTextColor = ColorPalette.soothingBreeze
    }
}
