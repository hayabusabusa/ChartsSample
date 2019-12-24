//
//  TabBarItemType.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

enum TabBarItemType {
    case dashboard
    
    var viewController: UIViewController {
        switch self {
        case .dashboard:
            let vc = DashboardViewController.instantiate()
            vc.tabBarItem = UITabBarItem(title: "ボード", image: UIImage(systemName: "chart.bar.fill"), tag: 0)
            return vc
        }
    }
}
