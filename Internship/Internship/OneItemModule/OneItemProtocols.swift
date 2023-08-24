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

protocol OneItemModuleOutput: class {
}

protocol OneItemViewInput: class {
}

protocol OneItemViewOutput: class {
}

protocol OneItemInteractorInput: class {
}

protocol OneItemInteractorOutput: class {
}

protocol OneItemRouterInput: class {
}
