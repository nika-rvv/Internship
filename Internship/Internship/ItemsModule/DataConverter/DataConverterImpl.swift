//
//  DataConverterImpl.swift
//  Internship
//
//  Created by Veronika on 28.08.2023.
//

import Foundation

final class DataConverterImpl: DataConverter {
    func convertData(from JSONData: [AdvertisementItems]) -> [ItemInfo] {
        var itemInfo: [ItemInfo] = []
        
        for elem in JSONData {
            let item = ItemInfo(id: elem.id,
                                title: elem.title,
                                price: elem.price,
                                location: elem.location,
                                imageURL: elem.imageURL,
                                createdDate: elem.createdDate)
            itemInfo.insert(item, at: 0)
        }
        
        return itemInfo
    }
}
