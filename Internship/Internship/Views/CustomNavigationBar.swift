//
//  CustomNavigationBar.swift
//  Internship
//
//  Created by Veronika on 31.08.2023.
//

import UIKit

final class NavigationBarView: UIView {
    typealias CloseClosure = () -> Void
    
    private var closeAction: CloseClosure?
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.mainTextColor
        label.textAlignment = .center
        return label
    }()

    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupConstraints()
        setupUI()
    }
}

extension NavigationBarView {
    func setupConstraints() {
        self.addSubview(mainLabel)
        self.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            mainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            
            backButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    func setupUI() {
        backButton.isUserInteractionEnabled = true
        backButton.addTarget(self, action:#selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func backButtonTapped(){
        closeAction?()
    }
}

extension NavigationBarView {
    func setConfigForItemsScreen() {
        backButton.isHidden = true
        mainLabel.text = "Товары"
    }
    
    func setupConfigForOneItemScreen(with title: String) {
        backButton.isHidden = false
        backButton.isUserInteractionEnabled = true
        mainLabel.text = title
    }
    
    func setCloseAction(_ action: @escaping CloseClosure) {
        self.closeAction = action
    }
}
