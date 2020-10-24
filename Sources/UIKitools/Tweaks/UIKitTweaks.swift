//
//  UIKitTweaks.swift
//  UIKitools
//
//  Created by Захар  Сегал on 9/28/20.
//

import UIKit

public func measureClosure(title: String, operation:()->()) {
  let startTime = CFAbsoluteTimeGetCurrent()
  operation()
  let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
  print("Time elapsed for \(title): \(timeElapsed) s")
}

public func randomRange(lower: UInt32 , upper: UInt32) -> UInt32 {
  return lower + arc4random_uniform(upper - lower + 1)
}

public func randomString(_ length: Int) -> String {
  
  let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  let len = UInt32(letters.length)
  
  var randomString = ""
  
  for _ in 0 ..< length {
    let rand = arc4random_uniform(len)
    var nextChar = letters.character(at: Int(rand))
    randomString += NSString(characters: &nextChar, length: 1) as String
  }
  
  return randomString
}

public func printAllAvailableFonts() {
  let fontFamilyNames = UIFont.familyNames
  
  for familyName in fontFamilyNames {
    print("------------------------------")
    print("Font Family Name = [\(familyName)]")
    let names = UIFont.fontNames(forFamilyName: familyName )
    print("Font Names = [\(names)]")
  }
}
