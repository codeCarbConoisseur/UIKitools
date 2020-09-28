//
//  UIDevice + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 9/21/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit
import AudioToolbox

// MARK: Vibrate
public extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(1519)
    }
}

