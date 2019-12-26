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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down.fill"), style: .plain, target: nil, action: nil)
    }
    
    private func setupViews() {
        
    }
}

// MARK: - ViewModel

extension TimerViewController {
    
    private func bindViewModel() {
        viewModel = TimerViewModel()
        
        let leftBarButtonItem = navigationItem.leftBarButtonItem!
        let notification =  NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification).map { _ in () }
        
        let input = TimerViewModel.Input(startButtonDidTap: startButton.rx.tap.asDriver(),
                                         stopButtonDidTap: stopButton.rx.tap.asDriver(),
                                         resetButtonDidTap: resetButton.rx.tap.asDriver(),
                                         closeButtonDidTap: leftBarButtonItem.rx.tap.asDriver(),
                                         didEnterBackground: notification.asDriver(onErrorDriveWith: .empty()))
        let output = viewModel.transform(input: input)
        
        output.timerDriver
            .drive(timerLabel.rx.text)
            .disposed(by: disposeBag)
        output.dismiss
            .drive(onNext: { [weak self] in self?.dismiss() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension TimerViewController {
    
    private func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
