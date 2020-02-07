//
//  Storyboard.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

enum Storyboard: String {
    // Application
    case RootViewController
    case WalkthroughViewController
    case LoginViewController
    case TabBarController
    case DashboardViewController
    case TimelineViewController
    case TimerViewController
    case SettingViewController
    // Charts
    case AverageBarChartViewController
    case HBarChartViewController
    case WeekAveLineChartViewController
    // Test
    case BarChartViewController
    case HorizontalBarChartViewController
    case LineChartViewController
    case PieChartViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type, inBundle: Bundle? = nil) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: inBundle).instantiateInitialViewController() as? VC else {
            fatalError("Storyboard named \(self.rawValue) wasn`t found")
        }
        return vc
    }
}
