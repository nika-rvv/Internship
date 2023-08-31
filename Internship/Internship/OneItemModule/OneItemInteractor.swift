//
//  OneItemInteractor.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

final class OneItemInteractor {
	weak var output: OneItemInteractorOutput?
    let itemId: String
    private let itemNetworkManager: NetworkManager?
    private let dataConverter: DataConverter?
    
    init(itemId: String, itemNetworkManager: NetworkManager?, dataConverter: DataConverter?) {
        self.itemId = itemId
        self.itemNetworkManager = itemNetworkManager
        self.dataConverter = dataConverter
    }
}

extension OneItemInteractor: OneItemInteractorInput {
    func fetchOneItemData() {
        Task {
            let adInfo = await itemNetworkManager?.fetchItemData(with: itemId)
            
            if let responseError = adInfo?.error{
                output?.showEror(error: responseError)
            }
            
            guard let data = adInfo?.data,
                  let itemData = dataConverter?.convertDataForOneItem(from: data) else {
                return
            }
            
            await MainActor.run {
                output?.loadData(info: itemData)
            }
        }
    }
}
