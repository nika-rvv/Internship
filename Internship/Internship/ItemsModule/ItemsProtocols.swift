//
//  ItemsProtocols.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

protocol ItemsModuleInput {
	var moduleOutput: ItemsModuleOutput? { get }
}

protocol ItemsModuleOutput: AnyObject {
}

protocol ItemsViewInput: AnyObject {
    func printData(adv: [ItemInfo])
}

protocol ItemsViewOutput: AnyObject {
    func didTapItem(at index: String)
    func loadData()
}

protocol ItemsInteractorInput: AnyObject {
    func fetchItemsData()
}

protocol ItemsInteractorOutput: AnyObject {
    func setFetchedData(itemsInfo: [ItemInfo])
}

protocol ItemsRouterInput: AnyObject {
    func openOneItemScreen(at index: String)
}
