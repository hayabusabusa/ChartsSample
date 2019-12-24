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
    
    // MARK: Lifecycle
    
    static func instantiate() -> WalkthroughViewController {
        let vc = Storyboard.WalkthroughViewController.instantiate(WalkthroughViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
    }
}

// MARK: - Setup

extension WalkthroughViewController {
    
    private func setupViews() {
        nextButton.isHidden = true
        scrollView.rx.currentPage
            .bind(to: pageControl.rx.currentPage)
            .disposed(by: disposeBag)
        scrollView.rx.currentPage
            .map { $0 != 2 }
            .bind(animated: nextButton.rx.animated.fade(duration: 0.1).isHidden)
            .disposed(by: disposeBag)
    }
}
