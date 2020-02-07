//
//  TimerCache.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/25.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

struct TimerCache: Codable {
    let isValid: Bool
    let enterDate: Date
    let rawTime: Int
    
    var difference: Int {
        return Int(Date().timeIntervalSince(enterDate))
    }
}
