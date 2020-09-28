//
//  UIViewController + Ext.swift
//  RoyalTransport
//
//  Created by Захар  Сегал on 7/20/20.
//  Copyright © 2020 Захар  Сегал. All rights reserved.
//

import UIKit

public extension UIViewController {
    func add(childViewController: UIViewController) {
        self.addChild(childViewController)
        self.view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    func insert(childViewController: UIViewController, belowSubview subview: UIView) {
        self.addChild(childViewController)
        self.view.insertSubview(childViewController.view, belowSubview: subview)
        childViewController.didMove(toParent: self)
    }
    
    func insert(childViewController: UIViewController, aboveSubview subview: UIView) {
        self.addChild(childViewController)
        self.view.insertSubview(childViewController.view, aboveSubview: subview)
        childViewController.didMove(toParent: self)
    }
    
    func insert(childViewController: UIViewController, at index: Int) {
        self.addChild(childViewController)
        self.view.insertSubview(childViewController.view, at: index)
        childViewController.didMove(toParent: self)
    }
    
    func removeFromeParent() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}

public extension UIViewController {
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboardName: String) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboardName, bundle: nil), identifier: nameOfClass)
    }
}

// MARK: ActivityViewController
public extension UIViewController {
    
    func startActivityIndicator(with spinnerController: SpinnerViewController) {
        addChild(spinnerController)
        spinnerController.view.frame = view.bounds
        view.addSubview(spinnerController.view)
        spinnerController.didMove(toParent: self)
    }
    
    func stopActivityIndicator(with spinnerController: SpinnerViewController) {
        spinnerController.willMove(toParent: nil)
        spinnerController.view.removeFromSuperview()
        spinnerController.removeFromParent()
    }
}

public extension UIViewController {
    
    func presentAlert(title: String, message: String, buttonTitle: String, handler: (() -> ()?)?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: buttonTitle,
            style: .default,
            handler: {action in
                handler?()
        }))
        self.present(alert, animated: true)
    }
    
}

// MARK: darkMode:
public extension UIViewController {
    func setupAdaptiveNavBar() {
        if #available(iOS 13.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                navigationController?.navigationBar.barTintColor = UIColor(hex: "#1F2B29", alpha: 1)
            } else {
                navigationController?.navigationBar.barTintColor = .white
            }
        } else {
            navigationController?.navigationBar.barTintColor = .white
        }
    }
}
