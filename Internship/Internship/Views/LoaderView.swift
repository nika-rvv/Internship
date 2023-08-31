//
//  LoaderView.swift
//  Internship
//
//  Created by Veronika on 31.08.2023.
//

import UIKit
import Lottie

final class LoaderView: UIView {
    let loaderAnimationView: LottieAnimationView = {
        let animation = LottieAnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.loopMode = .autoReverse
        return animation
    }()
    
    init(animationName: String) {
        super.init(frame: .zero)
        self.loaderAnimationView.animation = LottieAnimation.named(animationName)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension LoaderView {
    private func setupConstraints() {
        self.addSubview(loaderAnimationView)
        
        NSLayoutConstraint.activate([
            loaderAnimationView.heightAnchor.constraint(equalToConstant: 200),
            loaderAnimationView.widthAnchor.constraint(equalToConstant: 200),
            loaderAnimationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loaderAnimationView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func startAnimation() {
        loaderAnimationView.play()
    }
    
}
