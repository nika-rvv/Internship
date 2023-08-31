//
//  ErrorView.swift
//  Internship
//
//  Created by Veronika on 31.08.2023.
//

import UIKit
import Lottie

final class ErrorView: UIView {
    typealias ReloadClosure = () -> Void
    
    private var reloadAction: ReloadClosure?
    
    private let errorAnimation: LottieAnimationView = {
        let animation = LottieAnimationView()
        animation.animation = LottieAnimation.named(JSONEnum.errorAnimation.rawValue)
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.loopMode = .autoReverse
        return animation
    }()

    private let errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let reloadButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.setTitle("Перегрузить", for: .normal)
        button.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension ErrorView {
    func addViews() {
        self.addSubview(errorAnimation)
        self.addSubview(errorDescriptionLabel)
        self.addSubview(reloadButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            errorAnimation.topAnchor.constraint(equalTo: self.topAnchor),
            errorAnimation.heightAnchor.constraint(equalToConstant: 200),
            errorAnimation.widthAnchor.constraint(equalToConstant: 200),
            errorAnimation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            errorDescriptionLabel.topAnchor.constraint(equalTo: errorAnimation.bottomAnchor, constant: 20),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            
            reloadButton.topAnchor.constraint(equalTo: errorDescriptionLabel.bottomAnchor, constant: 16),
            reloadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            reloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            reloadButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc
    func reloadButtonTapped() {
        reloadAction?()
    }
}

extension ErrorView {
    func configureView(with error: String) {
        errorDescriptionLabel.text = error
        errorAnimation.play()
    }
    
    func setReloadAction(_ action: @escaping ReloadClosure) {
        self.reloadAction = action
    }
}
