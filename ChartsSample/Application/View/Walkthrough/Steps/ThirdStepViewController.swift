//
//  ThirdStepViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class ThirdSetpViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var layoutChartView: UIView!
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup

extension ThirdSetpViewController {
    
    private func setupViews() {
        layoutChartView.clipsToBounds = true
        layoutChartView.layer.cornerRadius = layoutChartView.bounds.width / 2
        layoutChartView.layer.borderWidth = 3
        layoutChartView.layer.borderColor = ColorPalette.chigong.cgColor
    }
}
