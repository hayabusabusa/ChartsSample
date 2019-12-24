//
//  NavigationController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

extension NavigationController {
    
    private func setupAppearance() {
        view.backgroundColor = .systemBackground
        
    }
}
