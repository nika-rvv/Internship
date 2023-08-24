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
}

protocol ItemsViewOutput: AnyObject {
    func didTapItem()
}

protocol ItemsInteractorInput: AnyObject {
}

protocol ItemsInteractorOutput: AnyObject {
}

protocol ItemsRouterInput: AnyObject {
    func openOneItemScreen()
}
