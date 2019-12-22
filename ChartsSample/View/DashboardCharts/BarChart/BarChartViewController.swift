//
//  BarChartViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

final class BarChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var chartView: BarChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> BarChartViewController {
        let vc = Storyboard.BarChartViewController.instantiate(BarChartViewController.self)
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

extension BarChartViewController {
    
    private func setupChartView() {
        // X axis
        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .bottom
        //chartView.xAxis.drawAxisLineEnabled = false
        // Y Left axis
        //chartView.leftAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = UIColor.gray.withAlphaComponent(0.3)
        //chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.labelCount = 4
        // Y Right axis
        chartView.rightAxis.enabled = false
        //chartView.rightAxis.drawAxisLineEnabled = false
    }
    
    private func setupChartData() {
        let rawData = [1, 2, 3, 4, 5, 6, 7]
        let chartEntries = rawData.map { BarChartDataEntry(x: Double($0), y: Double($0)) }
        let chartDataSet = BarChartDataSet(entries: chartEntries, label: "DataSet Label")
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [.orange]
        chartView.data = BarChartData(dataSet: chartDataSet)
    }
}
