//
//  ItemsInteractor.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

final class ItemsInteractor {
    weak var output: ItemsInteractorOutput?
    private let itemsNetworkManager: NetworkManager?
    
    init(output: ItemsInteractorOutput? = nil, itemsNetworkManager: NetworkManager?) {
        self.output = output
        self.itemsNetworkManager = itemsNetworkManager
    }
}

extension ItemsInteractor: ItemsInteractorInput {
    func fetchItmsData() {
        Task {
            let adInfo = await itemsNetworkManager?.fetchAdvertisments()
            
            if adInfo?.error != nil {
                print("error")
            }
            
            guard let data = adInfo?.adv  else {
                
                return
            }
            
            await MainActor.run {
                self.output?.setFetchedData(adv: data)
            }
        }
    }
}
