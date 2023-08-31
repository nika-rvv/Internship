//
//  ImageExtension.swift
//  Internship
//
//  Created by Veronika on 29.08.2023.
//

import UIKit
import Kingfisher

final class KingfisherImage: UIImageView {
    enum DefaultPlaceHolder {
        case item
    }
    
    private let cache = NSCache<NSString, UIImage>()
    private var urlString: String?
    private let placeHolderType: DefaultPlaceHolder
    
    init(placeHolderType: DefaultPlaceHolder) {
        self.placeHolderType = placeHolderType
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setImage(url: URL?) {
        self.kf.setImage(with: url, placeholder: getDefaultPlaceholder(), options: [.cacheMemoryOnly])
    }
    
    func setDefaultImage() {
        image = getDefaultPlaceholder()
    }
    
    private func getDefaultPlaceholder() -> UIImage? {
        switch placeHolderType {
        case .item:
            return UIImage(named: "Image")
        }
    }
}
