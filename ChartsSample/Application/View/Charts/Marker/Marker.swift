//
//  Marker.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2020/01/14.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

class Marker: MarkerView {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var axisLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    // MARK: Initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    // MARK: Overrides
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        axisLabel.text = "X: \(Int(entry.x))"
        valueLabel.text = String(format: "%0.2f時間", entry.y)
        layoutIfNeeded()
    }
    
    // MARK: Private
    
    private func commonInit() {
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
