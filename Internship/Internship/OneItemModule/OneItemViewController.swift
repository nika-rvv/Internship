//
//  OneItemViewController.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class OneItemViewController: UIViewController {
	private let output: OneItemViewOutput
    
    private let oneItemView = OneItemView()
    
    private let errorView = ErrorView()
    
    private let customNavBar: NavigationBarView = {
        let navBar = NavigationBarView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()

    init(output: OneItemViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.mainBackgroundColor
        setupViews()
        setupErrorView()
        setupActions()
        output.getOneItemData()
	}
}

private extension OneItemViewController {
    func setupViews() {
        view.addSubview(oneItemView)
        view.addSubview(customNavBar)
    
        oneItemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 88),
            
            oneItemView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor),
            oneItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oneItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            oneItemView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupErrorView() {
        view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        errorView.setReloadAction { [weak self] in
            self?.output.getOneItemData()
        }
    }
    
    func setupActions() {
        customNavBar.setCloseAction { [weak self] in
            self?.output.backToAllItems()
        }
    }
}

extension OneItemViewController: OneItemViewInput {
    func showLoaderView() {
        oneItemView.isHidden = true
        errorView.isHidden = true
        self.showLoader(animationName: JSONEnum.loadingAnimation.rawValue)
    }
    
    func setFetchedData(itemInfo: OneItemInfo) {
        errorView.isHidden = true
        customNavBar.setupConfigForOneItemScreen(with: itemInfo.title)
        oneItemView.configureViewWith(data: itemInfo)
    }
    
    func hideLoaderView() {
        self.hideLoader()
        errorView.isHidden = true
        oneItemView.isHidden = false
    }
    
    func showErrorAlert(error: String) {
        errorView.isHidden = false
        errorView.configureView(with: error)
    }
}

