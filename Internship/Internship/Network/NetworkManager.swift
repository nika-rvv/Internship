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
            return (nil, NetworkResponse.wrongURL.rawValue)
        }
        
        let urlSession = URLSession(configuration: .ephemeral)
        
        let result = try? await urlSession.data(from: urlResult)
        guard let data = result?.0 else {
            return (nil, NetworkResponse.noConnection.rawValue)
        }

        do {
            let advertisment = try JSONDecoder().decode(Advertisment.self, from: data)
            return (advertisment, nil)
        } catch {
            return (nil, NetworkResponse.unableToDecode.rawValue)
        }
        
    }
    
    func fetchItemData(with index: String) async -> (data: OneAdvertismentItem?, error: String?) {
        let url = URLBuilderImpl()
            .addScheme(scheme: "https")
            .addHost(host: "www.avito.st")
            .addPath("/s/interns-ios/details/" + index + ".json")
            .build()
        
        guard let urlResult = url else {
            return (nil, NetworkResponse.wrongURL.rawValue)
        }
    
        guard let data = try? await URLSession.shared.data(from: urlResult).0 else {
            return (nil, NetworkResponse.noConnection.rawValue)
        }


        do {
            let info = try JSONDecoder().decode(OneAdvertismentItem.self, from: data)
            return (info, nil)
        } catch {
            return (nil, NetworkResponse.unableToDecode.rawValue)
        }
    }
}

