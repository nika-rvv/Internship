//
//  NetworkManager.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    init() { }
    
         
    func fetchAdvertisments() async -> (adv: Advertisment?, error: String?) {
        let url = URLBuilderImpl()
            .addScheme(scheme: "https")
            .addHost(host: "www.avito.st")
            .addPath("/s/interns-ios/main-page.json")
            .build()
        
        guard let urlResult = url else {
            return (nil, "no url")
        }
    
        guard let data = try? await URLSession.shared.data(from: urlResult).0 else {
            return (nil, "error")
        }


        do {
            let advertisment = try JSONDecoder().decode(Advertisment.self, from: data)
            return (advertisment, nil)
        } catch {
            return (nil, "error")
        }
    }
    
}

