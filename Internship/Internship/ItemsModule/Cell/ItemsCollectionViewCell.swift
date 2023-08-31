//
//  ItemsCollectionViewCell.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//

import UIKit

final class ItemsCollectionViewCell: UICollectionViewCell {
//    private let itemStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 4
////        stackView.distribution = .fill
//        return stackView
//    }()
    
    private let itemImage: KingfisherImage = {
        let image = KingfisherImage(placeHolderType: .item)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private let itemLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let itemCreationDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemTitleLabel.text = ""
        itemPriceLabel.text = ""
        itemLocationLabel.text = ""
        itemCreationDateLabel.text = ""
    }
}

private extension ItemsCollectionViewCell {
    func setupViews() {
        self.addSubview(itemImage)
        self.addSubview(itemTitleLabel)
        self.addSubview(itemPriceLabel)
        self.addSubview(itemLocationLabel)
        self.addSubview(itemCreationDateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.topAnchor),
            itemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.67),
            
            itemTitleLabel.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 4),
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor),
            itemTitleLabel.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor),
            
            itemPriceLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 4),
            itemPriceLabel.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor),
            itemPriceLabel.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor),
            
            itemLocationLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: 4),
            itemLocationLabel.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor),
            itemLocationLabel.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor),
            
            itemCreationDateLabel.topAnchor.constraint(equalTo: itemLocationLabel.bottomAnchor, constant: 4),
            itemCreationDateLabel.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor),
            itemCreationDateLabel.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor),
            
        ])
    }
}

extension ItemsCollectionViewCell {
    func configureCell(with advInfo: ItemInfo) {
        itemImage.setImage(url: URL(string: advInfo.imageURL))
        itemTitleLabel.text = advInfo.title
        itemPriceLabel.text = advInfo.price
        itemLocationLabel.text = advInfo.location
        itemCreationDateLabel.text = advInfo.createdDate
    }
}
