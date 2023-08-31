//
//  ItemsViewController.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class ItemsViewController: UIViewController {
	private let output: ItemsViewOutput
    
    private let customNavBar: NavigationBarView = {
        let navBar = NavigationBarView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private lazy var itemsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    private lazy var itemsCollectionViewAdapter =  ItemCollectionAdapter(itemsCollectionView)
    
    private let errorView = ErrorView()
    
    init(output: ItemsViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupErrorView()
        setupActions()
        output.loadData()
    }
}

private extension ItemsViewController {
    func setupViews() {
        view.backgroundColor = UIColor.mainBackgroundColor
        itemsCollectionView.backgroundColor = UIColor.mainBackgroundColor
        itemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemsCollectionView.register(cellType: ItemsCollectionViewCell.self)
        itemsCollectionView.showsVerticalScrollIndicator = false
        view.addSubview(itemsCollectionView)
        view.addSubview(customNavBar)
        customNavBar.setConfigForItemsScreen()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 88),
            
            itemsCollectionView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor),
            itemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            itemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            itemsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupActions() {
        itemsCollectionViewAdapter.setTapAction { [weak self] index in
            self?.output.didTapItem(at: index)
        }
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
        
        errorView.setReloadAction {
            self.output.loadData()
        }
    }
}

extension ItemsViewController: ItemsViewInput {
    func setData(info: [ItemInfo]) {
        errorView.isHidden = true
        itemsCollectionViewAdapter.configure(info)
    }
    
    func showLoaderView() {
        errorView.isHidden = true
        itemsCollectionView.isHidden = true
        self.showLoader(animationName: JSONEnum.loadingAnimation.rawValue)
    }
    
    func hideLoaderView() {
        errorView.isHidden = true
        itemsCollectionView.isHidden = false
        self.hideLoader()
    }
    
    func showErrorAlert(error: String) {
        itemsCollectionView.isHidden = true
        customNavBar.isHidden = true
        errorView.isHidden = false
        errorView.configureView(with: error)
    }
}

