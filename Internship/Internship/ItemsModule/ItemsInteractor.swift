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
    private let contentProvider: ItemsContentProvider?
    private let dataConverter: DataConverter?
    
    init(itemsNetworkManager: NetworkManager, contentProvider: ItemsContentProvider, dataConverter: DataConverter) {
        self.itemsNetworkManager = itemsNetworkManager
        self.contentProvider = contentProvider
        self.dataConverter = dataConverter
    }
    
    func updateItems(with itemInfo: [ItemInfo]?) async {
        if let itemInfo = itemInfo {
            await MainActor.run {
                self.output?.setFetchedData(itemsInfo: itemInfo)
            }
        }
    }
}

extension ItemsInteractor: ItemsInteractorInput {
    func fetchItemsData() {
        Task {
            let adInfo = await itemsNetworkManager?.fetchAdvertisments()
            
            if adInfo?.error != nil {
                print("error")
            }
            
            guard let data = adInfo?.adv  else {
                
                return
            }
            let itemsData = dataConverter?.convertDataForItems(from: data.advertisements)
            self.contentProvider?.appendItem(data.advertisements)
            await updateItems(with: itemsData)
        }
    }
}
