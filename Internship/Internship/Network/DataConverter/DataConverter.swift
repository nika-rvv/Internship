//
//  DataConverter.swift
//  Internship
//
//  Created by Veronika on 28.08.2023.
//

import Foundation

protocol DataConverter {
    func convertDataForItems(from JSONData: [AdvertisementItems]) -> [ItemInfo]
    func convertDataForOneItem(from JSONData: OneAdvertismentItem) -> OneItemInfo
}
