//
//  UITableViewCell + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/27/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

public extension UITableViewCell {
  func addSeparatorLine(backgroundColor: UIColor, leftOffset: CGFloat, rightOffSet: CGFloat, height: CGFloat) {
    let separatorView: UIView = UIView(frame: .zero)
    separatorView.backgroundColor = backgroundColor
    contentView.addSubview(separatorView)
    separatorView.translatesAutoresizingMaskIntoConstraints = false
    let bottomConstraint = separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.5)
    let leftConstraint = separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftOffset)
    let rightConstraint = separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -rightOffSet)
    let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: height)
    NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
  }
}
