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
    
    static func instantiate() -> TabBarController {
        let vc = Storyboard.TabBarController.instantiate(TabBarController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - Setup

extension TabBarController {
    
    private func setupAppearance() {
        
    }
}
