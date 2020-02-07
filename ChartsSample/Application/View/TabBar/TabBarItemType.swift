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
    case timeline
    case setting
    
    var viewController: UIViewController {
        switch self {
        case .dashboard:
            let vc = DashboardViewController.instantiate()
            vc.tabBarItem = UITabBarItem(title: "ボード", image: UIImage(systemName: "chart.bar.fill"), tag: 0)
            return vc
        case .timeline:
            let vc = TimelineViewController.instantiate()
            vc.tabBarItem = UITabBarItem(title: "タイムライン", image: UIImage(systemName: "timer"), tag: 1)
            return vc
        case .setting:
            let vc = SettingViewController.instantiate()
            vc.tabBarItem = UITabBarItem(title: "設定", image: UIImage(systemName: "gear"), tag: 2)
            return vc
        }
    }
}
