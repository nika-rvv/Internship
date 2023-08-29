//
//  ReuseIdentifier.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: ReuseIdentifiable {}

extension UICollectionReusableView: ReuseIdentifiable {}

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                                                  for: indexPath) as? T else {
            fatalError("Can't deque")
        }
        return cell
    }
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        self.register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}
