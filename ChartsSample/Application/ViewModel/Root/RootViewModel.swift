//
//  RootViewModel.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class RootViewModel {
    
    // MARK: Dependency
    
    // MARK: Propreties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
}

extension RootViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let viewDidAppear: Signal<Void>
    }
    
    struct Output {
        let replaceRootToWalkthrough: Driver<Void>
        let replaceRootToLogin: Driver<Void>
        let replaceRootToTabBar: Driver<Void>
        let timerCacheDriver: Driver<TimerCache>
    }
    
    // MARK: Transform I/O
    
    func transform(input: RootViewModel.Input) -> RootViewModel.Output {
        let replaceRootToWalkthroughRelay: PublishRelay<Void> = .init()
        let replaceRootToLogin: PublishRelay<Void> = .init()
        let replaceRootToTabBarRelay: PublishRelay<Void> = .init()
        let timerCacheRelay: PublishRelay<TimerCache> = .init()
        
        input.viewDidAppear
            .emit(onNext: {
                switch LocalSettings.getUserStatus() {
                case .initial:
                    replaceRootToWalkthroughRelay.accept(())
                case .loggedOut:
                    replaceRootToLogin.accept(())
                case .loggedIn:
                    // Check timer cache
                    if let timerCache = LocalSettings.getTimerCache() {
                        timerCacheRelay.accept(timerCache)
                    } else {
                        replaceRootToTabBarRelay.accept(())
                    }
                }
            })
            .disposed(by: disposeBag)
        
        return Output(replaceRootToWalkthrough: replaceRootToWalkthroughRelay.asDriver(onErrorDriveWith: .empty()),
                      replaceRootToLogin: replaceRootToLogin.asDriver(onErrorDriveWith: .empty()),
                      replaceRootToTabBar: replaceRootToTabBarRelay.asDriver(onErrorDriveWith: .empty()),
                      timerCacheDriver: timerCacheRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
