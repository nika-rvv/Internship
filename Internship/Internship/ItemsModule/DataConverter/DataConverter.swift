//
//  DataConverter.swift
//  Internship
//
//  Created by Veronika on 28.08.2023.
//

import Foundation

protocol DataConverter {
    func convertData(from JSONData: [AdvertisementItems]) -> [ItemInfo]
}
