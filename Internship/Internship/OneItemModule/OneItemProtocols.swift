//
//  OneItemProtocols.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

protocol OneItemModuleInput {
	var moduleOutput: OneItemModuleOutput? { get }
}

protocol OneItemModuleOutput: AnyObject {
}

protocol OneItemViewInput: AnyObject {
    func setFetchedData(itemInfo: OneItemInfo)
    func showLoaderView()
    func hideLoaderView()
}

protocol OneItemViewOutput: AnyObject {
    func getOneItemData()
}

protocol OneItemInteractorInput: AnyObject {
    func fetchOneItemData()
}

protocol OneItemInteractorOutput: AnyObject {
    func loadData(info: OneItemInfo)
}

protocol OneItemRouterInput: AnyObject {
}
