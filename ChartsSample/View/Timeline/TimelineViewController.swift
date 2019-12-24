//
//  TimelineViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class TimelineViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> TimelineViewController {
        let vc = Storyboard.TimelineViewController.instantiate(TimelineViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
}
