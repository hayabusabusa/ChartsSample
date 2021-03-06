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
    
    // MARK: Lifecycle
    
    static func configureWith(timerCache: TimerCache?) -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        vc.viewModel = TimerViewModel(dependency: timerCache)
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
        let leftBarButtonItem = navigationItem.leftBarButtonItem!
        let backgroundNotification =  NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification).map { _ in () }
        let foregroundNotification = NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification).map { _ in () }
        
        let input = TimerViewModel.Input(startButtonDidTap: startButton.rx.tap.asDriver(),
                                         stopButtonDidTap: stopButton.rx.tap.asDriver(),
                                         resetButtonDidTap: resetButton.rx.tap.asDriver(),
                                         closeButtonDidTap: leftBarButtonItem.rx.tap.asDriver(),
                                         didEnterBackground: backgroundNotification.asDriver(onErrorDriveWith: .empty()),
                                         willEnterForeground: foregroundNotification.asDriver(onErrorDriveWith: .empty()))
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
