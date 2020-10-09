//
//  UICollectionView + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/23/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
  static var autoReuseIdentifier: String {
    return NSStringFromClass(self) + "AutogenerateIdentifier"
  }
}

public extension UICollectionView {
  var currentPageNumber: Int {
    return Int(ceil(self.contentOffset.x / self.frame.size.width))
  }
  
  func dequeue<T: UICollectionReusableView>(cell: T.Type, indexPath: IndexPath) -> T? {
    return dequeueReusableCell(withReuseIdentifier: T.autoReuseIdentifier, for: indexPath) as? T
  }
  
  func dequeue<T: UICollectionReusableView>(header: T.Type, indexPath: IndexPath) -> T? {
    return  dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: T.autoReuseIdentifier,
      for: indexPath)    as? T
  }
  
  func dequeue<T: UICollectionReusableView>(footer: T.Type, indexPath: IndexPath) -> T? {
    return  dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: T.autoReuseIdentifier,
      for: indexPath)    as? T
  }
  
  func registerNibCell<T: UICollectionReusableView>(_ cell: T.Type) {
    register(nibFromClass(cell), forCellWithReuseIdentifier: cell.autoReuseIdentifier)
  }
  
  func registerNibSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
    register(nibFromClass(header), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
             withReuseIdentifier: header.autoReuseIdentifier)
  }
  
  func registerNibSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
    register(nibFromClass(footer), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
             withReuseIdentifier: footer.autoReuseIdentifier)
  }
  
  func registerCell<T: UICollectionReusableView>(_ cell: T.Type) {
    register(cell, forCellWithReuseIdentifier: cell.autoReuseIdentifier)
  }
  
  func registerSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
    register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.autoReuseIdentifier)
  }
  
  func registerSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
    register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.autoReuseIdentifier)
  }
  
  // Private
  
  fileprivate func nibFromClass(_ type: UICollectionReusableView.Type) -> UINib? {
    guard let nibName = NSStringFromClass(type).components(separatedBy: ".").last
    else {
      return nil
    }
    
    return UINib(nibName: nibName, bundle: nil)
  }
}



