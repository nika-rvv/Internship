//
//  OneItemContainer.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class OneItemContainer {
    let input: OneItemModuleInput
	let viewController: UIViewController
	private(set) weak var router: OneItemRouterInput!

	static func assemble(with context: OneItemContext) -> OneItemContainer {
        let router = OneItemRouter()
        let itemId = context.itemId
        let networkManager = NetworkManager()
        let dataConverter = DataConverterImpl()
        let interactor = OneItemInteractor(itemId: itemId, itemNetworkManager: networkManager, dataConverter: dataConverter)
        let presenter = OneItemPresenter(router: router, interactor: interactor)
		let viewController = OneItemViewController(output: presenter)

        router.viewController = viewController

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return OneItemContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: OneItemModuleInput, router: OneItemRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct OneItemContext {
	weak var moduleOutput: OneItemModuleOutput?
    let itemId: String
}
