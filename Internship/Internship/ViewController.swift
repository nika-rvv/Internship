//
//  ViewController.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupCollectionView()
    }
}

private extension ViewController {
    func setupViews() {
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

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemsCollectionViewCell
        cell.backgroundColor = .red
        cell.configureCellWith(imageName: "Image", title: "Iphone", price: "55000", location: "Moscow", date: "23/08/23")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2.35, height: view.frame.height / 3.47)
    }
}
