//
//  OutlinedButton.swift
//  nissouken
//
//  Created by Yamada Shunya on 2019/12/09.
//  Copyright © 2019 Goldkey Co.,Ltd. All rights reserved.
//

import UIKit

//@IBDesignable
class OutlinedButton: UIButton {

    // MARK: IBInspectable

    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var borderColor: UIColor = .clear

    // MARK: Properties

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.4
        }
    }

    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()

        if let title = title(for: state) {
            setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key(String(kCTLanguageAttributeName)): "ja"]), for: .normal)
        }
    }

    private func commonInit() {
        isExclusiveTouch = true

        backgroundColor = .clear
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
