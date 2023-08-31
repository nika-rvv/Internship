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
    func showErrorAlert(error: String)
}

protocol OneItemViewOutput: AnyObject {
    func getOneItemData()
    func backToAllItems()
}

protocol OneItemInteractorInput: AnyObject {
    func fetchOneItemData()
}

protocol OneItemInteractorOutput: AnyObject {
    func loadData(info: OneItemInfo)
    func showEror(error: String)
}

protocol OneItemRouterInput: AnyObject {
    func backButtonTapped()
}
