//
//  SecondStepViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts
import RxCocoa

final class SecondStepViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var layoutChartView: UIView!
    @IBOutlet private weak var reloadButton: UIButton!
    @IBOutlet private weak var chartView: LineChartView!
    
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

extension SecondStepViewController {
    
    private func setupViews() {
        // View
        layoutChartView.clipsToBounds = true
        layoutChartView.layer.cornerRadius = layoutChartView.bounds.width / 2
        layoutChartView.layer.borderWidth = 3
        layoutChartView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        // Button
        reloadButton.rx.tap.asSignal()
            .emit(onNext: { [weak self] in self?.chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.4, easingOption: .easeInBounce) })
        .disposed(by: disposeBag)
    }
    
    private func setupChartView() {
        chartView.isUserInteractionEnabled = false
        // X axis
        chartView.xAxis.drawLabelsEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        // Y axis
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        // Animation
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.8, easingOption: .easeInBounce)
    }
    
    private func setupChartData() {
        let rawdata = [8, 3, 5, 10, 4]
        let entries = rawdata.enumerated().map { ChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = LineChartDataSet(entries: entries, label: "")
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 4
        dataSet.colors = [ColorPalette.brightYarrow]
        chartView.data = LineChartData(dataSet: dataSet)
    }
}
