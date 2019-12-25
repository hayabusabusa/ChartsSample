//
//  WalkthroughViewModel.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class WalkthroughViewModel {
    
    // MARK: Dependency
    
    // MARK: Propreties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
}

extension WalkthroughViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let nextButtonDidTap: Signal<Void>
    }
    
    struct Output {
        let replaceRootToLogin: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: WalkthroughViewModel.Input) -> WalkthroughViewModel.Output {
        input.nextButtonDidTap
            .emit(onNext: {
                LocalSettings.saveUserStatus(.loggedOut)
            })
            .disposed(by: disposeBag)
        
        return Output(replaceRootToLogin: input.nextButtonDidTap.asDriver(onErrorDriveWith: .empty()))
    }
}
