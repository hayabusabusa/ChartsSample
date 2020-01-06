//
//  Alert.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2020/01/06.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import RxSwift

enum Alert {
    
    enum Action {
        case ok
        
        var title: String {
            switch self {
            case .ok:
                return "OK"
            }
        }
        
        var style: UIAlertAction.Style {
            switch self {
            case .ok:
                return .default
            }
        }
    }
    
    static func present(in viewController: UIViewController, title: String?, message: String?, style: UIAlertController.Style, actions: [Action]) -> Observable<Action> {
        return Observable.create { observer in
            let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: style)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                observer.on(.completed)
            }))
            actions.forEach { action in
                alertController.addAction(UIAlertAction(title: action.title, style: action.style, handler: { _ in
                    observer.on(.next(action))
                }))
            }
            
            viewController.present(alertController, animated: true, completion: nil)
            return Disposables.create {
                alertController.dismiss(animated: false, completion: nil)
            }
        }
    }
}
