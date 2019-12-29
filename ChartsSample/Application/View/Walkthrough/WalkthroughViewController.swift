//
//  WalkthroughViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa

final class WalkthroughViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: Properties
    
    private var viewModel: WalkthroughViewModel!
    
    // MARK: Lifecycle
    
    static func instantiate() -> WalkthroughViewController {
        let vc = Storyboard.WalkthroughViewController.instantiate(WalkthroughViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
}

// MARK: - Setup

extension WalkthroughViewController {
    
    private func setupViews() {
        // ScrollView
        scrollView.rx.currentPage
            .bind(to: pageControl.rx.currentPage)
            .disposed(by: disposeBag)
        // 値が流れるタイミングによってはアニメーションがキャンセルされてしまう.
        // 3ページ -> 1ページに戻る -> 再度3ページに戻ってくるとアニメーションがおかしい.
        scrollView.rx.currentPage
            .map { $0 != 2 ? 0 : 1 }
            .bind(animated: nextButton.rx.animated.fade(duration: 0.3).alpha)
            .disposed(by: disposeBag)
        // Button
        nextButton.alpha = 0
    }
}

// MARK: - ViewModel

extension WalkthroughViewController {
    
    private func bindViewModel() {
        viewModel = WalkthroughViewModel()
        
        let input = WalkthroughViewModel.Input(nextButtonDidTap: nextButton.rx.tap.asSignal())
        let output = viewModel.transform(input: input)
        
        output.replaceRootToLogin
            .drive(onNext: { [weak self] in self?.replaceRootToTabBar() })
            .disposed(by: disposeBag)
    }
}

// MARK: Transition

extension WalkthroughViewController {
    
    func replaceRootToTabBar() {
        let vc = LoginViewController.instantiate()
        replaceRoot(to: vc)
    }
}
