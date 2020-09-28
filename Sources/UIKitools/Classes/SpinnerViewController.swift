//
//  SpinnerViewController.swift
//  UIKitools
//
//  Created by Захар  Сегал on 9/28/20.
//

import UIKit

public final class SpinnerViewController: UIViewController {
    fileprivate var spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    fileprivate var alpha: Double
    fileprivate var style: UIActivityIndicatorView.Style
    fileprivate var color: UIColor
    
    public init(alpha: Double, style: UIActivityIndicatorView.Style, color: UIColor) {
        self.alpha = alpha
        self.style = style
        self.color = color
        super.init(coder: NSCoder())!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        if #available(iOS 13.0, *) {
            spinner.style = .large
        } else {
            spinner.color = .gray
        }
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        if #available(iOS 13.0, *) {
            spinner.color = .label
        } else {
            spinner.color = .gray
        }
    }
    
}


