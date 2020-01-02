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

final class WeekAveLineChartViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var lineChartView: LineChartView!
    
    // MARK: Properties
    
    private var viewModel: WeekAveLineChartViewModel!
    
    // MARK: Lifecycle
    
    static func configureWith(studiesDriver: Driver<[Study]>) -> WeekAveLineChartViewController {
        let vc = Storyboard.WeekAveLineChartViewController.instantiate(WeekAveLineChartViewController.self)
        vc.viewModel = WeekAveLineChartViewModel(dependency: studiesDriver)
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

extension WeekAveLineChartViewController {
    
    private func setupChartView() {
        lineChartView.noDataFont = .boldSystemFont(ofSize: 14)
        lineChartView.noDataText = "データがありません"
        lineChartView.noDataTextColor = ColorPalette.soothingBreeze
        lineChartView.scaleXEnabled = false
        lineChartView.scaleYEnabled = false
        // X axis
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawLabelsEnabled = false
        lineChartView.xAxis.drawAxisLineEnabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        // Y right axis
        lineChartView.rightAxis.enabled = false
        // Y left axis
        lineChartView.leftAxis.drawAxisLineEnabled = false
        lineChartView.leftAxis.drawZeroLineEnabled = true
        lineChartView.leftAxis.labelCount = 4
        lineChartView.leftAxis.labelTextColor =  ColorPalette.soothingBreeze
        lineChartView.leftAxis.gridColor =  ColorPalette.soothingBreeze.withAlphaComponent(0.8)
        lineChartView.leftAxis.gridLineDashLengths = [2]
        lineChartView.leftAxis.zeroLineDashPhase = 0
        lineChartView.leftAxis.zeroLineColor =  ColorPalette.soothingBreeze.withAlphaComponent(0.8)
        lineChartView.leftAxis.zeroLineDashLengths = [2]
    }
}

// MARK: - ViewModel

extension WeekAveLineChartViewController {
    
    private func bindViewModel() {
        let input = WeekAveLineChartViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.studiesDriver
            .translate(with: StudyToWeekAveLineChartDataTranslator(fillColor: ColorPalette.mintLeaf))
            .drive(lineChartView.rx.data)
            .disposed(by: disposeBag)
    }
}
