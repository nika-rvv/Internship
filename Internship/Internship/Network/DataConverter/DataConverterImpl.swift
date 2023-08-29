//
//  DataConverterImpl.swift
//  Internship
//
//  Created by Veronika on 28.08.2023.
//

import Foundation

final class DataConverterImpl: DataConverter {
    func convertDataForOneItem(from JSONData: OneAdvertismentItem) -> OneItemInfo {
        let oneItemInfo = OneItemInfo(id: JSONData.id,
                                      title: JSONData.title,
                                      price: JSONData.price,
                                      location: JSONData.location,
                                      imageURL: JSONData.imageURL,
                                      createdDate: JSONData.createdDate,
                                      description: JSONData.description,
                                      email: JSONData.email,
                                      phoneNumber: JSONData.phoneNumber,
                                      address: JSONData.address)
        return oneItemInfo
    }
    
    func convertDataForItems(from JSONData: [AdvertisementItems]) -> [ItemInfo] {
        var itemInfo: [ItemInfo] = []
        
        for elem in JSONData {
            let item = ItemInfo(id: elem.id,
                                title: elem.title,
                                price: elem.price,
                                location: elem.location,
                                imageURL: elem.imageURL,
                                createdDate: elem.createdDate)
            itemInfo.append(item)
        }
        
        return itemInfo
    }
}
