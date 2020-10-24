//
//  UITableView + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/29/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//


import UIKit

public extension UITableView {
  func registerWithNib(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
    let className = cellType.nameOfClass
    let nib = UINib(nibName: className, bundle: bundle)
    register(nib, forCellReuseIdentifier: className)
  }
  
  func register(cellType: UITableViewCell.Type) {
    let className = cellType.nameOfClass
    register(cellType, forCellReuseIdentifier: className)
  }
  
  func registerWithNib(cellTypes: [UITableViewCell.Type], bundle: Bundle? = nil) {
    cellTypes.forEach { registerWithNib(cellType: $0, bundle: bundle) }
  }
  
  func register(cellTypes: [UITableViewCell.Type]) {
    cellTypes.forEach { register(cellType: $0) }
  }
  
  func registerHeaderFooterWithNib(cellType: UITableViewHeaderFooterView.Type, bundle: Bundle? = nil) {
    let className = cellType.nameOfClass
    let nib = UINib(nibName: className, bundle: bundle)
    register(nib, forHeaderFooterViewReuseIdentifier: className)
  }
  
  func registerHeaderFooter(cellType: UITableViewHeaderFooterView.Type) {
    let className = cellType.nameOfClass
    register(cellType, forHeaderFooterViewReuseIdentifier: className)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
    dequeueReusableCell(withIdentifier: type.nameOfClass, for: indexPath) as! T
  }
  
  func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
    dequeueReusableHeaderFooterView(withIdentifier: type.nameOfClass) as! T
  }
  
  func tableHeaderViewSizeToFit() {
    tableHeaderOrFooterViewSizeToFit(\.tableHeaderView)
  }
  
  func tableFooterViewSizeToFit() {
    tableHeaderOrFooterViewSizeToFit(\.tableFooterView)
  }
  
  private func tableHeaderOrFooterViewSizeToFit(_ keyPath: ReferenceWritableKeyPath<UITableView, UIView?>) {
    guard let headerOrFooterView = self[keyPath: keyPath] else { return }
    let height = headerOrFooterView
      .systemLayoutSizeFitting(CGSize(width: frame.width, height: 0),
                               withHorizontalFittingPriority: .required,
                               verticalFittingPriority: .fittingSizeLevel).height
    guard headerOrFooterView.frame.height != height else { return }
    headerOrFooterView.frame.size.height = height
    self[keyPath: keyPath] = headerOrFooterView
  }
  
  func deselectSelectedRow(animated: Bool) {
    guard let indexPathForSelectedRow = indexPathForSelectedRow else { return }
    deselectRow(at: indexPathForSelectedRow, animated: animated)
  }
  
  func reloadData(_ completion: @escaping () -> Void) {
    UIView.animate(withDuration: 0, animations: {
      self.reloadData()
    }, completion: { _ in
      completion()
    })
  }
}
