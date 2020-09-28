//
//  NameOfClass.swift
//  UIKitools
//
//  Created by Захар  Сегал on 9/28/20.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
