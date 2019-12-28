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
    
    @IBOutlet private weak var averageContainer: UIView!
    @IBOutlet weak var topContainer: UIView!
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
        bindViewModel()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupNavigation() {
        navigationItem.title = "ボード"
    }
}

// MARK: - ViewModel

extension DashboardViewController {
    
    private func bindViewModel() {
        viewModel = DashboardViewModel()
        
        let input = DashboardViewModel.Input(plusButtonDidTap: plusButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        let average = AverageBarChartViewController.configureWith(studiesDriver: output.mockStudiesDriver)
        embed(average, to: averageContainer)
        
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
