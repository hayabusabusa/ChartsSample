//
//  TimerViewModel.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class TimerViewModel {
    
    // MARK: Dependency
    
    typealias Dependeny = TimerCache?
    
    // MARK: Propreties
    
    private let timerCache: TimerCache?
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
    
    init(dependency: Dependeny) {
        self.timerCache = dependency
    }
}

extension TimerViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let startButtonDidTap: Driver<Void>
        let stopButtonDidTap: Driver<Void>
        let resetButtonDidTap: Driver<Void>
        let closeButtonDidTap: Driver<Void>
        let didEnterBackground: Driver<Void>
        let willEnterForeground: Driver<Void>
    }
    
    struct Output {
        let timerDriver: Driver<String>
        let dismiss: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: TimerViewModel.Input) -> TimerViewModel.Output {
        let isValidRelay: BehaviorRelay<Bool> = .init(value: false)
        let timerRelay: BehaviorRelay<Int> = .init(value: 0)
        
        // NOTE: Load timer cache and remove old cache.
        if let timerCache = timerCache {
            isValidRelay.accept(timerCache.isValid)
            timerRelay.accept(timerCache.isValid
                ? timerCache.rawTime + timerCache.difference
                : timerCache.rawTime)
            print("[TIMER] 💾 Load timer cache. \(timerCache)")
        }
        
        isValidRelay
            .distinctUntilChanged()
            .flatMapLatest { $0 ? Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance) : Observable.empty() }
            .share(replay: 1, scope: .forever)
            .subscribe(onNext: { _ in timerRelay.accept(timerRelay.value + 1) })
        .disposed(by: disposeBag)
        
        input.startButtonDidTap.map { true }
            .drive(isValidRelay)
            .disposed(by: disposeBag)
        input.stopButtonDidTap.map { false }
            .drive(isValidRelay)
            .disposed(by: disposeBag)
        input.resetButtonDidTap.map { 0 }
            .drive(timerRelay)
            .disposed(by: disposeBag)
        input.didEnterBackground
            .drive(onNext: {
                // Check timer and save cache
                // If timer was started or counted
                if isValidRelay.value == true || timerRelay.value > 0 {
                    let timerCache = TimerCache(isValid: isValidRelay.value, enterDate: Date(), rawTime: timerRelay.value)
                    LocalSettings.saveTimerCache(timerCache)
                    print("[TIMER] 💾 Save timer cache. \(timerCache)")
                }
            })
            .disposed(by: disposeBag)
        input.willEnterForeground
            .drive(onNext: {
                // NOTE: Load timer cache and remove old cache.
                if let timerCache = LocalSettings.getAndRemoveTimerCache() {
                    isValidRelay.accept(timerCache.isValid)
                    timerRelay.accept(timerCache.isValid
                        ? timerCache.rawTime + timerCache.difference
                        : timerCache.rawTime)
                    print("[TIMER] 💾 Load timer cache. \(timerCache)")
                }
            })
            .disposed(by: disposeBag)
        
        let timerDriver = timerRelay
            .map { String(format: "%02i:%02i:%02i", $0 / 3600, $0 / 60 % 60, $0 % 60) }
            .asDriver(onErrorDriveWith: .empty())
        return Output(timerDriver: timerDriver,
                      dismiss: input.closeButtonDidTap)
    }
}
