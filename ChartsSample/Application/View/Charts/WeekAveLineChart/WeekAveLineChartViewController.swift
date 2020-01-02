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
