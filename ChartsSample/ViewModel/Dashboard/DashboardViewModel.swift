//
//  DashboardViewModel.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class DashboardViewModel {
    
    // MARK: Dependency
    
    // MARK: Propreties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
}

extension DashboardViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let plusButtonDidTap: Driver<Void>
    }
    
    struct Output {
        let presentTimer: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: DashboardViewModel.Input) -> DashboardViewModel.Output {
        return Output(presentTimer: input.plusButtonDidTap)
    }
}
