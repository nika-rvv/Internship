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
    
    let url = URL(string: "https://www.avito.st/s/interns-ios/main-page.json")
         
    func fetchAdvertisments() async -> (adv: Advertisment?, error: String?) {
        guard let urlResult = url else {
            return (nil, "no url")
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: urlResult))
    
        guard let data = try? await URLSession.shared.data(from: urlResult).0 else {
            return (nil, "error")
        }

//        guard let response = dataTask.response as? HTTPURLResponse, (200 ... 299).contains(response.statusCode) else {
//            return (nil, "error")
//        }

        do {
            let advertisment = try JSONDecoder().decode(Advertisment.self, from: data)
            return (advertisment, nil)
        } catch {
            return (nil, "error")
        }
    }
}
