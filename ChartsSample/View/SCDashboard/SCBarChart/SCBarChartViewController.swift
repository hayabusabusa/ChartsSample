//
//  SCBarChartViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import SwiftCharts

final class SCBarChartViewController: UIViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    private var chart: Chart? // ARC
    
    // MARK: Lifecycle
    
    static func instantiate() -> SCBarChartViewController {
        let vc = Storyboard.SCBarChartViewController.instantiate(SCBarChartViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupChart()
    }
}

// MARK: - Setup

extension SCBarChartViewController {
    
    private func setupChart() {
        // IBが使えないのと、設定がダルすぎるので微妙...
        let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 8, by: 2))
        let chart = BarsChart(frame: view.frame,
                              chartConfig: chartConfig,
                              xTitle: "X axis",
                              yTitle: "",
                              bars: [
                                ("A", 1),
                                ("B", 3),
                                ("C", 5)],
                              color: .systemBlue,
                              barWidth: 16)
        self.view.addSubview(chart.view)
        self.chart = chart
    }
}
