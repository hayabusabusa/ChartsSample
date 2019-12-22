//
//  HorizontalBarChartViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/22.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

final class HorizontalBarChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var chartView: HorizontalBarChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> HorizontalBarChartViewController {
        let vc = Storyboard.HorizontalBarChartViewController.instantiate(HorizontalBarChartViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        setupChartData()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension HorizontalBarChartViewController {
    
    private func setupChartView() {
        
    }
    
    private func setupChartData() {
        let rawData = [1, 2, 3]
        let chartEntiries = rawData.map { BarChartDataEntry(x: Double($0), y: Double($0)) }
        let chartDataSet = BarChartDataSet(entries: chartEntiries, label: "Label")
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [.systemTeal]
        chartView.data = BarChartData(dataSet: chartDataSet)
    }
}
