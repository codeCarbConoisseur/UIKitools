//
//  UIColor.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/21/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(hex: String, alpha: Double) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 50, green: 50, blue: 50, alpha: CGFloat(alpha))
            return
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
