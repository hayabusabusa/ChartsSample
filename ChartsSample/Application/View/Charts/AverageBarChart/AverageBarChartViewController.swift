//
//  AverageBarChartViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/28.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts
import RxCocoa

final class AverageBarChartViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var averageLabel: UILabel!
    @IBOutlet private weak var barChartView: BarChartView!
    
    // MARK: Properties
    
    private var viewModel: AverageBarChartViewModel!
    
    // MARK: Lifecycle
    
    static func configureWith(studiesDriver: Driver<[Study]>) -> AverageBarChartViewController {
        let vc = Storyboard.AverageBarChartViewController.instantiate(AverageBarChartViewController.self)
        vc.viewModel = AverageBarChartViewModel(dependency: studiesDriver)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        bindViewModel()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension AverageBarChartViewController {
    
    private func setupChartView() {
        barChartView.noDataFont = .boldSystemFont(ofSize: 14)
        barChartView.noDataText = "データがありません"
        barChartView.noDataTextColor = ColorPalette.soothingBreeze
        barChartView.scaleXEnabled = false
        barChartView.scaleYEnabled = false
        barChartView.legend.enabled = false
        // X axis
        barChartView.xAxis.enabled = false
        barChartView.xAxis.labelPosition = .bottom
        // Y right axis
        barChartView.rightAxis.enabled = false
        // Y left axis
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.gridColor = ColorPalette.soothingBreeze.withAlphaComponent(0.8)
        barChartView.leftAxis.labelTextColor = ColorPalette.soothingBreeze
        barChartView.leftAxis.labelCount = 3
        barChartView.leftAxis.gridLineDashLengths = [4]
    }
}

// MARK: - ViewModel

extension AverageBarChartViewController {
    
    private func bindViewModel() {
        let input = AverageBarChartViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.studiesDriver
            .map { $0.reduce(0.0) { $0 + Double($1.seconds) / 3600 } / Double($0.count) }
            .drive(onNext:  { [weak self] in
                let limitLine = ChartLimitLine(limit: $0)
                limitLine.drawLabelEnabled = false
                limitLine.lineColor = ColorPalette.firstDate
                limitLine.lineDashLengths = [2]
                self?.barChartView.leftAxis.removeAllLimitLines()
                self?.barChartView.leftAxis.addLimitLine(limitLine)
                self?.averageLabel.text = String(format: "%.2f時間", $0)
            })
            .disposed(by: disposeBag)
        output.studiesDriver
            .translate(with: StudyToBarChartDataTranslator())
            .drive(barChartView.rx.data)
            .disposed(by: disposeBag)
    }
}
