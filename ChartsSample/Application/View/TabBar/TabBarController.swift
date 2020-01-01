//
//  TabBarController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    deinit {
        print("[DEINIT] ✨🧹 \(type(of: self)) was deinited.")
    }
    
    static func instantiate() -> TabBarController {
        let vc = Storyboard.TabBarController.instantiate(TabBarController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupTabBar()
    }
}

// MARK: - Setup

extension TabBarController {
    
    private func setupAppearance() {
        tabBar.tintColor = ColorPalette.electronBlue
        tabBar.unselectedItemTintColor = ColorPalette.soothingBreeze
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
    }
    
    private func setupTabBar() {
        viewControllers = [TabBarItemType.dashboard, TabBarItemType.timeline, .setting]
            .map { NavigationController(rootViewController: $0.viewController) }
    }
}
