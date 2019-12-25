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
    }
}

// MARK: - Setup

extension TimerViewController {
    
    private func setupNavigation() {
        navigationItem.title = "タイマー"
    }
    
    private func setupViews() {
        // Timer
        timerRelay
            .map { String(format: "%02i:%02i:%02i", $0 / 3600, $0 / 60 % 60, $0 % 60) }
            .bind(to: timerLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
}
