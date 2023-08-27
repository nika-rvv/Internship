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
    private let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

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
        setupCollectionView()
        output.loadData()
    }
}

private extension ItemsViewController {
    func setupViews() {
        view.backgroundColor = .white
        itemsCollectionView.backgroundColor = .white
        view.addSubview(itemsCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            itemsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            itemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            itemsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupCollectionView() {
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.showsVerticalScrollIndicator = false
    }
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemsCollectionViewCell
        cell.configureCellWith(imageName: "Image", title: "Iphone", price: "55000", location: "Moscow", date: "23/08/23")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2.35, height: view.frame.height / 3.47)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didTapItem()
    }
}

extension ItemsViewController: ItemsViewInput {
    func printData(adv: Advertisment) {
        print(adv)
    }
}

