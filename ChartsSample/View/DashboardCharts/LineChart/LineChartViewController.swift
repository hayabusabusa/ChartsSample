//
//  LineChartViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

final class LineChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var chartView: LineChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> LineChartViewController {
        let vc = Storyboard.LineChartViewController.instantiate(LineChartViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        setupChartData()
    }
}

// MARK: - Setup

extension LineChartViewController {
    
    private func setupChartView() {
        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        //chartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .easeInOutElastic) // チラつく
        // X axis
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineColor = UIColor.gray.withAlphaComponent(0.3)
        chartView.xAxis.labelTextColor = .lightGray
        // Y right axis
        chartView.rightAxis.enabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.labelCount = 5
        // Y left axis
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = UIColor.gray.withAlphaComponent(0.3)
        chartView.leftAxis.labelTextColor = .lightGray
        chartView.leftAxis.labelCount = 5
    }
    
    private func setupChartData() {
        let rawData = [1, 2, 3, 5, 7, 11]
        let chartDataEntries = rawData.map { ChartDataEntry(x: Double($0), y: Double($0)) }
        let chartDataSet = LineChartDataSet(entries: chartDataEntries, label: "Label")
        let gradient = CGGradient(colorsSpace: nil,
                                  colors: [UIColor.systemGreen.withAlphaComponent(0.8).cgColor, UIColor.clear.cgColor] as CFArray,
                                  locations: nil)
        chartDataSet.drawValuesEnabled = false
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.mode = .horizontalBezier
        chartDataSet.fill = Fill(linearGradient: gradient!, angle: -90)
        chartDataSet.fillAlpha = 1
        chartDataSet.drawFilledEnabled = true
        chartDataSet.colors = [.systemGreen]
        chartDataSet.highlightEnabled = false
        chartView.data = LineChartData(dataSet: chartDataSet)
    }
}
