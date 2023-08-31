//
//  ItemsEntity.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation
struct Advertisment: Codable {
    let advertisements: [AdvertisementItems]
}

// MARK: - Advertisement
struct AdvertisementItems: Codable {
    let id, title, price, location: String
    let imageURL: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
}

struct OneAdvertismentItem: Codable {
    let id, title, price, location: String
    let imageURL: String
    let createdDate, description, email, phoneNumber: String
    let address: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
        case description, email
        case phoneNumber = "phone_number"
        case address
    }
}
