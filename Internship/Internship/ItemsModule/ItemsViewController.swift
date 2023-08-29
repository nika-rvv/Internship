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
    
    private lazy var itemsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    private lazy var itemsCollectionViewAdapter =  ItemCollectionAdapter(itemsCollectionView)
    
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
        setupActions()
        output.loadData()
    }
}

private extension ItemsViewController {
    func setupViews() {
        view.backgroundColor = .white
        itemsCollectionView.backgroundColor = .white
        itemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemsCollectionView.register(cellType: ItemsCollectionViewCell.self)
        itemsCollectionView.showsVerticalScrollIndicator = false
        view.addSubview(itemsCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            itemsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
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
}

extension ItemsViewController: ItemsViewInput {
    func printData(adv: [ItemInfo]) {
        print(adv)
        itemsCollectionViewAdapter.configure(adv)
    }
}

