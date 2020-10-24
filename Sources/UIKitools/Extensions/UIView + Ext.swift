//
//  UIView + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/21/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit
import Foundation

public extension UIView {
  func shake(duration: CFTimeInterval = 0.5) {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.values = [ -10, 10, -5 ]
    animation.duration = duration / Double(animation.values!.count)
    self.layer.add(animation, forKey: "shake")
  }
}

public extension UIView {
  func setLinearGradient(startColor: UIColor, endColor: UIColor) -> CALayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = self.bounds
    
    
    self.layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }
}

public extension UIView {
  func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
    if let _ = viewWithTag(475647){
      return
    }
    let backgroundView = UIView()
    backgroundView.layer.zPosition = 1
    backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    backgroundView.backgroundColor = backgroundColor
    backgroundView.tag = 475647
    
    var activityIndicator = UIActivityIndicatorView()
    activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
    activityIndicator.center = self.center
    activityIndicator.hidesWhenStopped = true
    if #available(iOS 13.0, *) {
      activityIndicator.style = .large
    } else {
      activityIndicator.style = .gray
    }
    activityIndicator.color = .white
    activityIndicator.startAnimating()
    self.isUserInteractionEnabled = false
    
    backgroundView.addSubview(activityIndicator)
    
    self.addSubview(backgroundView)
  }
  func activityStopAnimating(withDelay: Double = 0) {
    if withDelay > 0 {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        removeActivityIndicator()
      }
    }
    removeActivityIndicator()
  }
  
  fileprivate func removeActivityIndicator() {
    if let background = viewWithTag(475647){
      background.removeFromSuperview()
    }
    self.isUserInteractionEnabled = true
  }
}

/// DEBUG!
//extension UIView {
//    public func dump() {
//        Swift.print(perform(Selector(("recursiveDescription"))))
//    }
//}

// MARK: Gradient:
public extension UIView {
  // For insert layer in Foreground
  func addGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
  }
  // For insert layer in background
  func addGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
  }
}


public extension UIView {
  func fillSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    if let superview = superview {
      leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
      rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
  }
}
