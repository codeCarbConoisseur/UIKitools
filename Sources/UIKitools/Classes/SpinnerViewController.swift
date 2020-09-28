//
//  SpinnerViewController.swift
//  UIKitools
//
//  Created by Захар  Сегал on 9/28/20.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    var alpha: Double
    var style: UIActivityIndicatorView.Style
    var color: UIColor
    
    init(alpha: Double, style: UIActivityIndicatorView.Style, color: UIColor) {
        self.alpha = alpha
        self.style = style
        self.color = color
        super.init(coder: NSCoder())!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
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


