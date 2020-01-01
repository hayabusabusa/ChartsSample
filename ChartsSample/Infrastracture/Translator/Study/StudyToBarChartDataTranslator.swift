//
//  StudyToBarChartDataTranslator.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/01.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation
import Charts

struct StudyToBarChartDataTranslator: ViewableTranslator {
    typealias Input = [Study]
    typealias Output = BarChartData
    
    func translate(_ input: [Study]) -> BarChartData {
        let entries = input.enumerated()
            .map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element.seconds) / 3600) }
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.drawValuesEnabled = false
        dataSet.colors = [ColorPalette.robinsEggBlue]
        return BarChartData(dataSet: dataSet)
    }
}
