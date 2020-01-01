//
//  HBarChartViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/28.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts
import RxCocoa

final class HBarChartViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var horizontalBarChartView: HorizontalBarChartView!
    
    // MARK: Properties
    
    private var viewModel: HBarChartViewModel!
    
    // MARK: Lifecycle
    
    static func configureWith(studiesDriver: Driver<[Study]>) -> HBarChartViewController {
        let vc = Storyboard.HBarChartViewController.instantiate(HBarChartViewController.self)
        vc.viewModel = HBarChartViewModel(dependency: studiesDriver)
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

extension HBarChartViewController {
    
    private func setupChartView() {
        // X axis
        horizontalBarChartView.xAxis.drawGridLinesEnabled = false
        horizontalBarChartView.xAxis.labelCount = 3
        horizontalBarChartView.xAxis.labelPosition = .bottom
        horizontalBarChartView.xAxis.gridColor = ColorPalette.soothingBreeze.withAlphaComponent(0.6)
        horizontalBarChartView.xAxis.labelTextColor = ColorPalette.soothingBreeze
        // Y right axis
        horizontalBarChartView.rightAxis.gridLineDashLengths = [4]
        horizontalBarChartView.rightAxis.labelCount = 4
        horizontalBarChartView.rightAxis.gridColor = ColorPalette.soothingBreeze.withAlphaComponent(0.6)
        horizontalBarChartView.rightAxis.labelTextColor = ColorPalette.soothingBreeze
        // Y left axis
        horizontalBarChartView.leftAxis.enabled = false
    }
}

// MARK: - ViewModel

extension HBarChartViewController {
    
    private func bindViewModel() {
        let input = HBarChartViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.studiesDriver
            .translate(with: StudyToHBarChartTranslator())
            .drive(onNext: { [weak self] data in
                self?.horizontalBarChartView.data = data
                self?.horizontalBarChartView.animate(yAxisDuration: 1.8, easingOption: .easeInOutExpo)
            })
            .disposed(by: disposeBag)
    }
}
