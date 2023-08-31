//
//  UIViewController+Loader.swift
//  Internship
//
//  Created by Veronika on 31.08.2023.
//

import UIKit

extension UIViewController {
    func showLoader(animationName: String) {
        let loaderView = LoaderView(animationName: animationName)
        
        self.view.addSubview(loaderView)
        
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        loaderView.startAnimation()
    }
    
    func hideLoader() {
        let loaderView = self.view.subviews.first { $0 is LoaderView }
        loaderView?.removeFromSuperview()
    }
    
    func showLoaderIfNeeded(isLoading: Bool, animationName: String) {
        if isLoading {
            showLoader(animationName: animationName)
        } else {
            hideLoader()
        }
    }
}
