//
//  LoginViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/28.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    static func instantiate() -> LoginViewController {
        return Storyboard.LoginViewController.instantiate(LoginViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
}
