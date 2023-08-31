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
    func didTapItem(at index: String) {
        router.openOneItemScreen(at: index)
    }
    
    func loadData() {
        interactor.fetchItemsData()
        view?.showLoaderView()
    }
}

extension ItemsPresenter: ItemsInteractorOutput {
    func showEror(error: String) {
        view?.hideLoaderView()
        view?.showErrorAlert(error: error)
    }
    
    func setFetchedData(itemsInfo: [ItemInfo]) {
        view?.setData(info: itemsInfo)
        view?.hideLoaderView()
    }
}
