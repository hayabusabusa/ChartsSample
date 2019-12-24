//
//  WalkthroughViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/24.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class WalkthroughViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> WalkthroughViewController {
        let vc = Storyboard.WalkthroughViewController.instantiate(WalkthroughViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
