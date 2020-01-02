//
//  WeekAveLineChartViewModel.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/02.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class WeekAveLineChartViewModel {
    
    // MARK: Dependency
    
    typealias Dependency = Driver<[Study]>
    
    // MARK: Propreties
    
    private let studiesDriver: Driver<[Study]>
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
    
    init(dependency: Dependency) {
        self.studiesDriver = dependency
    }
}

extension WeekAveLineChartViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        
    }
    
    struct Output {
        let studiesDriver: Driver<[Study]>
    }
    
    // MARK: Transform I/O
    
    func transform(input: WeekAveLineChartViewModel.Input) -> WeekAveLineChartViewModel.Output {
        return Output(studiesDriver: studiesDriver)
    }
}
