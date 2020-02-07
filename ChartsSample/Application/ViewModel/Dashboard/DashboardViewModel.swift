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
    
    typealias Dependency = MockStudyProvider
    
    // MARK: Propreties
    
    private let mockStudyProvider: MockStudyProvider
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
    
    init(dependency: Dependency = MockStudyProviderImpl.shared) {
        self.mockStudyProvider = dependency
    }
}

extension DashboardViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let plusButtonDidTap: Driver<Void>
    }
    
    struct Output {
        let mockStudiesDriver: Driver<[Study]>
        let presentTimer: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: DashboardViewModel.Input) -> DashboardViewModel.Output {
        return Output(mockStudiesDriver: mockStudyProvider.studiesRelay.asDriver(),
                      presentTimer: input.plusButtonDidTap)
    }
}
