//
//  ItemsContentProvider.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation

protocol ItemsContentProvider {
    func getItem(by index: Int) -> AdvertisementItems
    func appendItem(_ items: [AdvertisementItems])
}
