//
//  UITableViewCell + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/27/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func addSeparatorLine(leftOffset: CGFloat, rightOffSet: CGFloat) {
        let separatorView: UIView = UIView(frame: .zero)
        separatorView.backgroundColor = UIColor(hex: "#E6EFEC", alpha: 1)
        contentView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint = separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.5)
        let leftConstraint = separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftOffset)
        let rightConstraint = separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -rightOffSet)
        let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: 1)
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
    }
}
