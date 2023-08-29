//
//  ItemsPresenter.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

final class ItemsPresenter {
	weak var view: ItemsViewInput?
    weak var moduleOutput: ItemsModuleOutput?
    
	private let router: ItemsRouterInput
	private let interactor: ItemsInteractorInput
    
    init(router: ItemsRouterInput, interactor: ItemsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ItemsPresenter: ItemsModuleInput {
}

extension ItemsPresenter: ItemsViewOutput {
    func didTapItem() {
        router.openOneItemScreen()
    }
    
    func loadData() {
        interactor.fetchItemsData()
    }
}

extension ItemsPresenter: ItemsInteractorOutput {
    func setFetchedData(itemsInfo: [ItemInfo]) {
        view?.printData(adv: itemsInfo)
    }
}
