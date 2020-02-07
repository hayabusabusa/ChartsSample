//
//  NavigationController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: Overrides
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        setupBackButton(viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - Setup

extension NavigationController {
    
    private func setupAppearance() {
        view.backgroundColor = .systemBackground
        navigationBar.isTranslucent = false
        navigationBar.tintColor = ColorPalette.electronBlue
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorPalette.electronBlue]
    }
}

// MARK: - Private

extension NavigationController {
    
    private func setupBackButton(_ viewController: UIViewController) {
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.leftBarButtonItem = backButtonItem
    }
}
