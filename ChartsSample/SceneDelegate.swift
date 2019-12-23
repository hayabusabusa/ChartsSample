//
//  SceneDelegate.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/21.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRoot(windowScene)
    }
}

extension SceneDelegate {
    
    private func setupRoot(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = NavigationController(rootViewController: DashboardViewController.instantiate())
        self.window = window
        window.makeKeyAndVisible()
    }
}
