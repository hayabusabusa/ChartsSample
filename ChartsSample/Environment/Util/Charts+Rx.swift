//
//  Charts+Rx.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Charts
import RxCocoa
import RxSwift

extension Reactive where Base: BarChartView {
    public var data: Binder<BarChartData?> {
        return Binder(self.base) { (barChartView, data) in
            barChartView.data = data
            barChartView.animate(yAxisDuration: 1.8, easingOption: .easeInOutElastic)
        }
    }
}

extension Reactive where Base: HorizontalBarChartView {
    public var data: Binder<BarChartData?> {
        return Binder(self.base) { (horizontalBarChartView, data) in
            horizontalBarChartView.data = data
            horizontalBarChartView.animate(yAxisDuration: 1.8, easingOption: .easeInOutExpo)
        }
    }
}

extension Reactive where Base: LineChartView {
    public var data: Binder<LineChartData?> {
        return Binder(self.base) { (lineChartView, data) in
            lineChartView.data = data
            lineChartView.animate(yAxisDuration: 1.8, easingOption: .easeInOutExpo)
        }
    }
}
