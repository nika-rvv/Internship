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
    func printData(adv: Advertisment)
}

protocol ItemsViewOutput: AnyObject {
    func didTapItem()
    func loadData()
}

protocol ItemsInteractorInput: AnyObject {
    func fetchItmsData()
}

protocol ItemsInteractorOutput: AnyObject {
    func setFetchedData(adv: Advertisment)
}

protocol ItemsRouterInput: AnyObject {
    func openOneItemScreen()
}
