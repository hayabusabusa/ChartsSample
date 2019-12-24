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
        // X axis
        //chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.labelCount = 3
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.gridColor = UIColor.gray.withAlphaComponent(0.3)
        chartView.xAxis.labelTextColor = .lightGray
        // Y right axis
        //chartView.rightAxis.enabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.labelCount = 4
        chartView.rightAxis.gridColor = UIColor.gray.withAlphaComponent(0.3)
        chartView.rightAxis.labelTextColor = .lightGray
        // Y left axis
        chartView.leftAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.labelCount = 4
        // Offset
        chartView.setExtraOffsets(left: 4, top: 8, right: 0, bottom: 8)
    }
    
    private func setupChartData() {
        let rawData = [1, 2, 3, 4]
        let chartEntiries = rawData.map { BarChartDataEntry(x: Double($0), y: Double($0)) }
        let chartDataSet = BarChartDataSet(entries: chartEntiries, label: "Label")
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [.systemTeal]
        chartView.data = BarChartData(dataSet: chartDataSet)
    }
}
