//
//  DashboardViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DashboardViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secondContainer: UIView!
    @IBOutlet weak var thirdContainer: UIView!
    
    // MARK: Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardViewController {
        let vc = Storyboard.DashboardViewController.instantiate(DashboardViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupChild()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension DashboardViewController {
    
    private func setupNavigation() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipses.bubble"), style: .plain, target: self, action: nil)
        navigationItem.title = "Dashboard"
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.rx.tap.asSignal()
            .emit(onNext: { [weak self] in self?.presentPopover() })
            .disposed(by: disposeBag)
    }
    
    private func setupChild() {
        let barChart = BarChartViewController.instantiate()
        embed(barChart, to: firstContainer)
        
        let horizontalBarChart = HorizontalBarChartViewController.instantiate()
        embed(horizontalBarChart, to: secondContainer)
        
        let pieChart = PieChartViewController.instantiate()
        embed(pieChart, to: thirdContainer)
    }
}

// MARK: - Popover delegate

extension DashboardViewController: UIPopoverPresentationControllerDelegate {
    
    private func presentPopover() {
        let vc = DashboardPopoverViewController.instantiate()
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 240, height: 300)
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.permittedArrowDirections = .any
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
