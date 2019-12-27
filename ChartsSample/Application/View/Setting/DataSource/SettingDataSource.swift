//
//  SettingDataSource.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettingDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [SettingSectionType]
    var _itemModels: [SettingSectionType] = [SettingSectionType]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return _itemModels.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch _itemModels[section] {
        case let .aboutApp(title, _):
            return title
        case let .aboutTestData(title, _):
            return title
        case let .logout(title, _):
            return title
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _itemModels[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch _itemModels[indexPath.section].rows[indexPath.row] {
        case let .modifyStudies(title, status):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingListCell.reuseIdentifier, for: indexPath) as! SettingListCell
            cell.setupCell(title: title, status: status)
            return cell
        case let .about(title, status):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingListCell.reuseIdentifier, for: indexPath) as! SettingListCell
            cell.setupCell(title: title, status: status)
            return cell
        case let .version(title, status):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingListCell.reuseIdentifier, for: indexPath) as! SettingListCell
            cell.setupCell(title: title, status: status, accessoryType: .none, selectionStyle: .none)
            return cell
        case let .logout(title, status):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingListCell.reuseIdentifier, for: indexPath) as! SettingListCell
            cell.setupCell(title: title, status: status, accessoryType: .none)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[SettingSectionType]>) {
        Binder(self) { dataSource, element in
            dataSource._itemModels = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
}
