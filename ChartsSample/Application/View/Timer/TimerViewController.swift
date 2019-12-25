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
    
    // MARK: Properties
    
    private let isValidRelay: BehaviorRelay<Bool> = .init(value: false)
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
    }
}

// MARK: - Setup

extension TimerViewController {
    
    private func setupNavigation() {
        navigationItem.title = "タイマー"
    }
    
    private func setupViews() {
        // Timer
        isValidRelay.asObservable()
            .debug("isValid", trimOutput: false)
            .flatMapLatest { $0 ? Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance) : Observable.empty() }
            .share(replay: 1, scope: .forever)
            .debug("Timer", trimOutput: false)
            .map { String(format: "%02i:%02i:%02i", $0 / 3600, $0 / 60 % 60, $0 % 60) }
            .bind(to: timerLabel.rx.text)
            .disposed(by: disposeBag)
        // Button
        startButton.rx.tap.map { true }
            .bind(to: isValidRelay)
            .disposed(by: disposeBag)
        stopButton.rx.tap.map { false }
            .bind(to: isValidRelay)
            .disposed(by: disposeBag)
    }
}
