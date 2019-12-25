//
//  TimerViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class TimerViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: Properties
    
    private var viewModel: TimerViewModel!
    
    private let timerRelay: BehaviorRelay<Int> = .init(value: 0)
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
        bindViewModel()
    }
}

// MARK: - Setup

extension TimerViewController {
    
    private func setupNavigation() {
        navigationItem.title = "タイマー"
    }
    
    private func setupViews() {
        
    }
}

// MARK: - ViewModel

extension TimerViewController {
    
    private func bindViewModel() {
        viewModel = TimerViewModel()
        
        let input = TimerViewModel.Input(startButtonDidTap: startButton.rx.tap.asDriver(),
                                         stopButtonDidTap: stopButton.rx.tap.asDriver(),
                                         resetButtonDidTap: resetButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.timerDriver
            .drive(timerLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
