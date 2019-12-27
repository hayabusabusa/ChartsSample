//
//  SettingListCell.swift
//  ChartsSample
//
//  Created by Yamada Shunya on 2019/12/27.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

class SettingListCell: UITableViewCell {

    // MARK: IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    
    // MARK: Properties
    
    static let reuseIdentifier = "SettingListCell"
    static let rowHeight: CGFloat = 44
    static var nib: UINib {
        return UINib(nibName: "SettingListCell", bundle: nil)
    }
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Setup
    
    func setupCell(title: String?, status: String?) {
        titleLabel.text = title
        statusLabel.text = status
        statusLabel.isHidden = status == nil
    }
}
