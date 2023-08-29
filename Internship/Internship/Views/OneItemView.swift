//
//  OneItemView.swift
//  Internship
//
//  Created by Veronika on 29.08.2023.
//

import UIKit

final class OneItemView: UIView {
    private let oneItemImage: KingfisherImage = {
        let image = KingfisherImage(placeHolderType: .item)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    private(set) lazy var labelViews: [UILabel] = {
        var labelViews = [UILabel]()
        for value in 0..<10 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.numberOfLines = 0
            labelViews.append(label)
        }
        return labelViews
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupLabelViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

private extension OneItemView {
    func setupViews() {
        self.addSubview(oneItemImage)
        NSLayoutConstraint.activate([
            oneItemImage.topAnchor.constraint(equalTo: self.topAnchor),
            oneItemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            oneItemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            oneItemImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
        ])
        
        if let firstView = labelViews.first, labelViews.count > 1 {
            self.addSubview(firstView)
            NSLayoutConstraint.activate([
                firstView.topAnchor.constraint(equalTo: oneItemImage.bottomAnchor, constant: 12),
                firstView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                firstView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
            ])
            
            for value in 1..<10{
                self.addSubview(labelViews[value])
                NSLayoutConstraint.activate([
                    labelViews[value].topAnchor.constraint(equalTo: labelViews[value - 1].bottomAnchor, constant: 8),
                    labelViews[value].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                    labelViews[value].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
                ])
            }
        } else {
            self.addSubview(labelViews[0])
            NSLayoutConstraint.activate([
                labelViews[0].topAnchor.constraint(equalTo: oneItemImage.bottomAnchor, constant: 12),
                labelViews[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                labelViews[0].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
            ])

        }
    }
    
    func setupLabelViews() {
        for value in 0..<10 {
            switch value {
            case 0:
                labelViews[value].font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            case 1:
                labelViews[value].font = UIFont.systemFont(ofSize: 18, weight: .medium)
            case 2, 3:
                labelViews[value].textColor = .darkGray
                labelViews[value].font = UIFont.systemFont(ofSize: 14, weight: .light)
            case 4, 6:
                labelViews[value].font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            default:
                labelViews[value].font = UIFont.systemFont(ofSize: 16, weight: .regular)
            }
        }
    }
    
}

extension OneItemView {
    func configureViewWith(data: OneItemInfo) {
        oneItemImage.setImage(url: URL(string: "\(data.imageURL)"))
        labelViews[0].text = data.title
        labelViews[1].text = data.price
        labelViews[2].text = data.location
        labelViews[3].text = data.createdDate
        labelViews[5].text = data.description
        labelViews[7].text = data.email
        labelViews[8].text = data.phoneNumber
        labelViews[9].text = data.address
    }
}
