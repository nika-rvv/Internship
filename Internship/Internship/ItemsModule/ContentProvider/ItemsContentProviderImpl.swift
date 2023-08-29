//
//  ItemsContentProviderImpl.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation

final class ItemsContentProviderImpl: ItemsContentProvider {
    private var items: [AdvertisementItems] = []
    
    func getItem(by index: Int) -> AdvertisementItems {
        return items[index]
    }
    
    func appendItem(_ items: [AdvertisementItems]) {
        self.items.append(contentsOf: items)
    }
}
