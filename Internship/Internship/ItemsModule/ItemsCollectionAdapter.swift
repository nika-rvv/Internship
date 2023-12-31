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
    typealias TapOnItemAction = (String) -> Void
    
    private var didTapOnItemAction: TapOnItemAction?
    
    enum Section {
        case main
    }
    
    private weak var collectionView: UICollectionView?
    
    private var itemsInfo: [ItemInfo] = []
    
    private lazy var dataSource: DataSource = setupDataSource()
    private lazy var collectionViewLayout: Layout = setupLayout()
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.delegate = self
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
    
    func setTapAction(_ action: @escaping TapOnItemAction) {
        self.didTapOnItemAction = action
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
            return self?.configureVerticalLayoutSection()
        }
        return layout
    }
    
    func configureVerticalLayoutSection() -> NSCollectionLayoutSection {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(290))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing * 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        return section
    }
}

extension ItemCollectionAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapOnItemAction?(itemsInfo[indexPath.item].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInfo.count
    }
}
