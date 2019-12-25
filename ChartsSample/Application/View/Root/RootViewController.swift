//
//  RootViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class RootViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    private var viewModel: RootViewModel!
    
    // MARK: Lifecycle
    
    static func instantiate() -> RootViewController {
        let vc = Storyboard.RootViewController.instantiate(RootViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

// MARK: - ViewModel

extension RootViewController {
    
    private func bindViewModel() {
        viewModel = RootViewModel()
        
        let input = RootViewModel.Input(viewDidAppear: rx.viewDidAppear.take(1).asSignal(onErrorSignalWith: .empty()))
        let output = viewModel.transform(input: input)
        
        output.replaceRootToWalkthrough
            .drive(onNext: { [weak self] in self?.replaceRootToWalkthrough() })
            .disposed(by: disposeBag)
        output.replaceRootToTabBar
            .drive(onNext: { [weak self] in self?.replaceRootToTabBar() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension RootViewController {
    
    private func replaceRootToWalkthrough() {
        let vc = WalkthroughViewController.instantiate()
        replaceRoot(to: vc)
    }
    
    private func replaceRootToTabBar() {
        let vc = TabBarController.instantiate()
        replaceRoot(to: vc)
    }
}