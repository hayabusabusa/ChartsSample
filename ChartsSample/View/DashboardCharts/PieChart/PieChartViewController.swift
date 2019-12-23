//
//  PieChartViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

final class PieChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var chartView: PieChartView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> PieChartViewController {
        let vc = Storyboard.PieChartViewController.instantiate(PieChartViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        setupChartData()
    }
}

// MARK: - Setup

extension PieChartViewController {
    
    private func setupChartView() {
        
    }
    
    private func setupChartData() {
        let rawData = [1, 2, 3]
        let chartEntries = rawData.map { PieChartDataEntry(value: Double($0), label: "data\($0)") }
        let chartDataSet = PieChartDataSet(entries: chartEntries)
        chartDataSet.colors = [.systemRed, .systemBlue, .systemYellow]
        chartDataSet.label = ""
        chartView.data = PieChartData(dataSet: chartDataSet)
    }
}
