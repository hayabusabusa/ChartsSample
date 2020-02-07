//
//  SettingSectionType.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

enum SettingSectionType {
    case aboutTestData(title: String?, rows: [SettingCellType])
    case aboutApp(title: String?, rows: [SettingCellType])
    case logout(title: String?, rows: [SettingCellType])
    
    enum SettingCellType {
        case modifyStudies(title: String, status: String?)
        case modifyTimeline(title: String, status: String?)
        case about(title: String, status: String?)
        case version(title: String, status: String?)
        case logout(title: String, status: String?)
    }
    
    var rows: [SettingCellType] {
        switch self {
        case let .aboutTestData(_, rows):
            return rows
        case let .aboutApp(_, rows):
            return rows
        case let .logout(_, rows):
            return rows
        }
    }
}
