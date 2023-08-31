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

    init(output: OneItemViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupErrorView()
        output.getOneItemData()
	}
}

private extension OneItemViewController {
    func setupViews() {
        view.addSubview(oneItemView)
        oneItemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneItemView.topAnchor.constraint(equalTo: view.topAnchor),
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
}

extension OneItemViewController: OneItemViewInput {
    func showLoaderView() {
        oneItemView.isHidden = true
        errorView.isHidden = true
        self.showLoader(animationName: JSONEnum.loadingAnimation.rawValue)
    }
    
    func setFetchedData(itemInfo: OneItemInfo) {
        errorView.isHidden = true
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

