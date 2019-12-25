//
//  TimerViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class TimerViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimerViewController {
        let vc = Storyboard.TimerViewController.instantiate(TimerViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
}

// MARK: - Setup

extension TimerViewController {
    
    private func setupNavigation() {
        navigationItem.title = "タイマー"
    }
}
