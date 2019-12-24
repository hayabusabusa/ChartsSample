//
//  DashboardPopoverViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class DashboardPopoverViewController: UITableViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var testModeSwitch: UISwitch!
    
    // MARK: Properties
    
    private let disposeBag = DisposeBag()
    
    weak var delegate: DashboardPopoverPresentDelegate?
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardPopoverViewController {
        let vc = Storyboard.DashboardPopoverViewController.instantiate(DashboardPopoverViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup

extension DashboardPopoverViewController {
    
    private func setupViews() {
        testModeSwitch.setOn(true, animated: false)
        testModeSwitch.rx.isOn.asSignal(onErrorSignalWith: .empty())
            .map { DashboardPopoverPresentDelegateType.modeChanged(isTest: $0) }
            .emit(onNext: { [weak self] type in
                self?.delegate?.onDismiss(type)
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
