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
}

protocol OneItemViewOutput: AnyObject {
}

protocol OneItemInteractorInput: AnyObject {
}

protocol OneItemInteractorOutput: AnyObject {
}

protocol OneItemRouterInput: AnyObject {
}
