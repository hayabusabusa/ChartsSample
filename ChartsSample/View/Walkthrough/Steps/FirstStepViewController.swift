//
//  FirstStepViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

final class FirstSetpViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var layoutChartView: UIView!
    @IBOutlet private weak var chartView: CombinedChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupChartView()
        setupChartData()
    }
}

// MARK: - Setup

extension FirstSetpViewController {
    
    private func setupViews() {
        layoutChartView.clipsToBounds = true
        layoutChartView.layer.cornerRadius = layoutChartView.bounds.width / 2
        layoutChartView.layer.borderWidth = 3
        layoutChartView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    }
    
    private func setupChartView() {
        chartView.dragEnabled = false
        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.highlightFullBarEnabled = false
        chartView.isUserInteractionEnabled = false
        // X axis
        chartView.xAxis.drawLabelsEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        // Y axis
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
    }
    
    private func setupChartData() {
        // Bar
        let rawBarData = [4, 8, 5, 12, 9]
        let barDataEntries = rawBarData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let barDataSet = BarChartDataSet(entries: barDataEntries, label: "")
        barDataSet.drawValuesEnabled = false
        barDataSet.colors = [ColorPalette.mintLeaf]
        let barData = BarChartData(dataSet: barDataSet)
        // Line
        let rawLineData = [2, 6, 4, 8, 7]
        let lineDataEntries = rawLineData.enumerated().map { ChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let lineDataSet = LineChartDataSet(entries: lineDataEntries, label: "")
        lineDataSet.drawValuesEnabled = false
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.colors = [ColorPalette.electronBlue]
        lineDataSet.lineWidth = 3
        let lineData = LineChartData(dataSet: lineDataSet)
        // Combine
        let combineData = CombinedChartData()
        combineData.barData = barData
        combineData.lineData = lineData
        chartView.data = combineData
    }
}
