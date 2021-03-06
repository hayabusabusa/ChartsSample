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
    
    typealias Dependency = MockStudyProvider
    
    // MARK: Propreties
    
    private let mockStudyProvider: MockStudyProvider
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
    
    init(dependency: Dependency = MockStudyProviderImpl.shared) {
        self.mockStudyProvider = dependency
    }
}

extension SettingViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let selectedRow: Driver<IndexPath>
        let logoutAlertOk: Driver<Alert.Action>
    }
    
    struct Output {
        let settingsDriver: Driver<[SettingSectionType]>
        let replaceRootToLogin: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: SettingViewModel.Input) -> SettingViewModel.Output {
        let settingsRelay: BehaviorRelay<[SettingSectionType]> = .init(value: [])
        let replaceRootToLoginRelay: PublishRelay<Void> = .init()
        
        settingsRelay.accept([
            .aboutTestData(title: "テストデータについて", rows: [.modifyStudies(title: "勉強データを変更", status: nil), .modifyTimeline(title: "タイムラインのデータを変更", status: nil)]),
            .aboutApp(title: "アプリについて", rows: [.about(title: "このアプリについて", status: nil), .version(title: "バージョン", status: "1.0.0")]),
            .logout(title: nil, rows: [.logout(title: "ログアウト", status: nil)])
        ])
        
        input.selectedRow
            .map { settingsRelay.value[$0.section].rows[$0.row] }
            .drive(onNext: { [weak self] row in
                guard let self = self else { return }
                switch row {
                case .modifyStudies:
                    self.mockStudyProvider.acceptRandomMock(number: Int.random(in: 0 ..< 15))
                case .logout:
                    input.logoutAlertOk
                        .filter { $0 == .ok }
                        .debug()
                        .drive(onNext: { _ in
                            LocalSettings.saveUserStatus(.loggedOut)
                            replaceRootToLoginRelay.accept(())
                        })
                        .disposed(by: self.disposeBag)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        return Output(settingsDriver: settingsRelay.asDriver(),
                      replaceRootToLogin: replaceRootToLoginRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
