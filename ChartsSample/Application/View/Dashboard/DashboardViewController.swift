//
//  DashboardViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts
import RxCocoa

final class DashboardViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var avarageChartView: BarChartView!
    @IBOutlet private weak var plusButton: UIButton!
    
    // MARK: Properties
    
    private var viewModel: DashboardViewModel!
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupChartView()
        bindViewModel()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupNavigation() {
        navigationItem.title = "ボード"
    }
    
    private func setupChartView() {
        avarageChartView.scaleXEnabled = false
        avarageChartView.scaleYEnabled = false
        // X axis
        avarageChartView.xAxis.enabled = false
        avarageChartView.xAxis.labelPosition = .bottom
        // Y right axis
        avarageChartView.rightAxis.enabled = false
        // Y left axis
        avarageChartView.leftAxis.drawAxisLineEnabled = false
        avarageChartView.leftAxis.gridColor = ColorPalette.soothingBreeze.withAlphaComponent(0.5)
        avarageChartView.leftAxis.labelTextColor = ColorPalette.soothingBreeze
        avarageChartView.leftAxis.gridLineDashLengths = [4]
    }
}

// MARK: - ViewModel

extension DashboardViewController {
    
    private func bindViewModel() {
        viewModel = DashboardViewModel()
        
        let input = DashboardViewModel.Input(plusButtonDidTap: plusButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.mockStudiesDriver
            .map { $0.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element.seconds)) } }
            .map {
                let dataSet = BarChartDataSet(entries: $0)
                dataSet.drawValuesEnabled = false
                dataSet.colors = [ColorPalette.shyMoment]
                return dataSet
            }
            .map { BarChartData(dataSet: $0) }
            .drive(onNext: { [weak self] data in
                self?.avarageChartView.data = data
                self?.avarageChartView.animate(yAxisDuration: 0.8, easingOption: .easeInOutElastic)
            })
            .disposed(by: disposeBag)
        output.presentTimer
            .drive(onNext: { [weak self] in self?.presentTimer() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension DashboardViewController {
    
    private func presentTimer() {
        let vc = NavigationController(rootViewController: TimerViewController.configureWith(timerCache: nil))
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
