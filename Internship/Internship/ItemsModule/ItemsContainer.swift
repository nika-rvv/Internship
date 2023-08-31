//
//  ItemsContainer.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class ItemsContainer {
    let input: ItemsModuleInput
	let viewController: UIViewController
	private(set) weak var router: ItemsRouterInput!

	static func assemble(with context: ItemsContext) -> ItemsContainer {
        let router = ItemsRouter()
        let itemsNetworkManager = NetworkManager()
        let itemsContentProvider = ItemsContentProviderImpl()
        let dataConverter = DataConverterImpl()
        let interactor = ItemsInteractor(itemsNetworkManager: itemsNetworkManager, contentProvider: itemsContentProvider, dataConverter: dataConverter)
        let presenter = ItemsPresenter(router: router, interactor: interactor)
		let viewController = ItemsViewController(output: presenter)

        router.viewController = viewController
		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return ItemsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ItemsModuleInput, router: ItemsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ItemsContext {
	weak var moduleOutput: ItemsModuleOutput?
    let window: UIWindow?
}
