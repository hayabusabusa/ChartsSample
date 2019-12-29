//
//  RoundedTextField.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/29.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit

//@IBDesignable
class RoundedTextField: UITextField {

    // MARK: IBInspectable
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var placeholderColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4)

    // MARK: Properties
    
    // MARK: Overrides
    
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
    }

    // MARK: Initializer
    
    private func commonInit() {
        isExclusiveTouch = true
        borderStyle = .none
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        layer.cornerRadius = frame.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth

        setupView()
    }

    // MARK: Private
    
    private func setupView() {
        let padding = frame.height / 2
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        rightViewMode = .always
    }
}
