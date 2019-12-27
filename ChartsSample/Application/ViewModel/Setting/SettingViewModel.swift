//
//  SettingViewModel.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SettingViewModel {
    
    // MARK: Dependency
    
    // MARK: Propreties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
}

extension SettingViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        
    }
    
    struct Output {
        let settingsDriver: Driver<[SettingCellType]>
    }
    
    // MARK: Transform I/O
    
    func transform(input: SettingViewModel.Input) -> SettingViewModel.Output {
        let settingsRelay: BehaviorRelay<[SettingCellType]> = .init(value: [])
        
        settingsRelay.accept([
            .normal(title: "設定1"),
            .withStatus(title: "設定2", status: "未設定")
        ])
        
        return Output(settingsDriver: settingsRelay.asDriver())
    }
}
