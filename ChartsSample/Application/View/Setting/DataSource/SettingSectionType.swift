//
//  SettingSectionType.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

enum SettingSectionType {
    case aboutApp(title: String?, rows: [SettingCellType])
    
    enum SettingCellType {
        case normal(title: String)
        case withStatus(title: String, status: String?)
    }
    
    var rows: [SettingCellType] {
        switch self {
        case let .aboutApp(_, rows):
            return rows
        }
    }
}
