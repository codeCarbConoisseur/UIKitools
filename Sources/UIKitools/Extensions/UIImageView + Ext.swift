//
//  UIImageView + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/29/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

public extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
