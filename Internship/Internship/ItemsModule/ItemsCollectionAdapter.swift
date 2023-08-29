//
//  ItemsCollectionAdapter.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import UIKit

final class ItemCollectionAdapter: NSObject {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ItemInfo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ItemInfo>
    typealias Layout = UICollectionViewCompositionalLayout
    
    enum Section {
        case main
    }
    
    private let collectionView: UICollectionView?
    
    private var itemsInfo: [ItemInfo] = []
    
    private lazy var dataSource: DataSource = setupDataSource()
    private lazy var collectionViewLayout: Layout = setupLayout()
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func configure(_ info: [ItemInfo]) {
        self.itemsInfo.append(contentsOf: info)
        applySnapshot(animated: true)
    }
    
    func addSection(_ info: ItemInfo) {
        self.itemsInfo.append(info)
        applySnapshot(animated: true)
    }
    
}

private extension ItemCollectionAdapter {
    func setupDataSource() -> DataSource {
        guard let collectionView = collectionView else {
            fatalError("No collection in adapter")
        }
        
        let dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueCell(cellType: ItemsCollectionViewCell.self, for: indexPath)
            cell.configureCell(with: item)
            return cell
        }
        
        return dataSource
    }
    
    func applySnapshot(animated: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(itemsInfo, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    func setupLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] section, _ in
            let section = self?.dataSource.snapshot().sectionIdentifiers[section]
            switch section {
            case .main:
                return self?.configureVerticalLayoutSection()
            case .none:
                return nil
            }
        }
        return layout
    }
    
    func configureVerticalLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets.top = 5
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .estimated(250))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        group.contentInsets.leading = 10
        group.contentInsets.trailing = 10

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets.leading = 10
        section.contentInsets.trailing = 10
        section.contentInsets.top = 10
        
        return section
    }
}

extension ItemCollectionAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
        print("tapped \(section)")
//        didTapOnEventsAction?(section.sectionType, indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInfo.count
    }
    
    
}

//extension ItemsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemsCollectionViewCell
//        cell.configureCellWith(imageName: "Image", title: "Iphone", price: "55000", location: "Moscow", date: "23/08/23")
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width / 2.35, height: view.frame.height / 3.47)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(24.0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        output.didTapItem()
//    }
//}
