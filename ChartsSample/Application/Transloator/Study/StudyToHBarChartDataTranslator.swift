//
//  StudyToHBarChartDataTranslator.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/01.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Charts

struct StudyToHBarChartDataTranslator: ViewableTranslator {
    typealias Input = [Study]
    typealias Output = BarChartData?
    
    func translate(_ input: [Study]) -> BarChartData? {
        guard !input.isEmpty else { return nil }
        // Sort and slice
        let poppedStudies = popLast(input, to: 2)
        // Create bar chart data
        let entries = poppedStudies.enumerated()
            .map { BarChartDataEntry(x: Double($0.offset + 1), y: Double($0.element.seconds) / 3600) }
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.drawValuesEnabled = false
        dataSet.colors = poppedStudies.map { UIColor(hex: $0.colorCode) }
        return BarChartData(dataSet: dataSet)
    }
    
    private func popLast(_ studies: [Study], to index: Int) -> [Study] {
        var popping = studies.sorted(by: { $1.seconds > $0.seconds })
        var popped: [Study] = [Study]()
        for _ in 0 ... index {
            if let last = popping.popLast() {
                popped.append(last)
            }
        }
        return popped
    }
}
