//
//  LoginViewModel.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/30.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel {
    
    // MARK: Dependency
    
    // MARK: Propreties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Initializer
}

extension LoginViewModel: ViewModelType {
    
    // MARK: I/O
    
    struct Input {
        let nameTextFieldDidInput: Driver<String>
        let passwordTextFieldDidInput: Driver<String>
        let setButtonDidTap: Driver<Void>
    }
    
    struct Output {
        let nameErrorDriver: Driver<String>
        let passwordErrorDriver: Driver<String>
        let replaceRootToTabBar: Driver<Void>
    }
    
    // MARK: Transform I/O
    
    func transform(input: LoginViewModel.Input) -> LoginViewModel.Output {
        let nameErrorRelay: PublishRelay<String> = .init()
        let passwordErrorRelay: PublishRelay<String> = .init()
        let replaceRootToTabBarRelay: PublishRelay<Void> = .init()
        
        input.setButtonDidTap
            .drive(onNext: {
                LocalSettings.saveUserStatus(.loggedIn)
                replaceRootToTabBarRelay.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(nameErrorDriver: nameErrorRelay.asDriver(onErrorDriveWith: .empty()),
                      passwordErrorDriver: passwordErrorRelay.asDriver(onErrorDriveWith: .empty()),
                      replaceRootToTabBar: replaceRootToTabBarRelay.asDriver(onErrorDriveWith: .empty()))
    }
}
