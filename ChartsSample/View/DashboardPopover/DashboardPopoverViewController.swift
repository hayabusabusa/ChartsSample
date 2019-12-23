//
//  DashboardPopoverViewController.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/23.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class DashboardPopoverViewController: UITableViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var barChartSwitch: UISwitch!
    
    // MARK: Properties
    
    weak var delegate: DashboardPopoverPresentDelegate?
    
    // MARK: Lifecycle
    
    static func instantiate() -> DashboardPopoverViewController {
        let vc = Storyboard.DashboardPopoverViewController.instantiate(DashboardPopoverViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        delegate?.onDismiss()
        super.dismiss(animated: flag, completion: completion)
    }
}
