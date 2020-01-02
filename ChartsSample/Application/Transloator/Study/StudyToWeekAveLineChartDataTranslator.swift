//
//  StudyToWeekAveLineChartDataTranslator.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

struct StudyToWeekAveLineChartDataTranslator: ViewableTranslator {
    typealias Input = [Study]
    typealias Output = LineChartData
    
    let fillColor: UIColor
    
    func translate(_ input: [Study]) -> LineChartData {
        let entries = input.enumerated().map { ChartDataEntry(x: Double($0.offset), y: Double($0.element.seconds / 3600)) }
        let dataSet = LineChartDataSet(entries: entries, label: "This is label")
        let gradient = CGGradient(colorsSpace: nil,
                                  colors: [fillColor.withAlphaComponent(0.8).cgColor,
                                           UIColor.white.withAlphaComponent(0.4).cgColor] as CFArray,
                                  locations: nil)
        dataSet.mode = .horizontalBezier
        dataSet.fill = Fill(linearGradient: gradient!, angle: -90)
        dataSet.fillAlpha = 1
        dataSet.drawFilledEnabled = true
        dataSet.colors = [fillColor]
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.lineWidth = 2
        dataSet.highlightLineWidth = 0
        return LineChartData(dataSet: dataSet)
    }
}
