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
        let selectedRow: Driver<IndexPath>
    }
    
    struct Output {
        let settingsDriver: Driver<[SettingSectionType]>
    }
    
    // MARK: Transform I/O
    
    func transform(input: SettingViewModel.Input) -> SettingViewModel.Output {
        let settingsRelay: BehaviorRelay<[SettingSectionType]> = .init(value: [])
        
        settingsRelay.accept([
            .aboutApp(title: "アプリについて", rows: [.normal(title: "設定"), .withStatus(title: "設定", status: "未設定")])
        ])
        
        input.selectedRow
            .map { settingsRelay.value[$0.section].rows[$0.row] }
            .drive(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        return Output(settingsDriver: settingsRelay.asDriver())
    }
}