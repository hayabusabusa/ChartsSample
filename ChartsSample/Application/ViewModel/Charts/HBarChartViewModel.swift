//
//  HBarChartViewModel.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/28.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HBarChartViewModel {
    
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

extension HBarChartViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        
    }
    
    struct Output {
        let studiesDriver: Driver<[Study]>
    }
    
    // MARK: Transform I/O
    
    func transform(input: HBarChartViewModel.Input) -> HBarChartViewModel.Output {
        return Output(studiesDriver: studiesDriver)
    }
}
