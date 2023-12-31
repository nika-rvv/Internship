//
//  OneItemPresenter.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import Foundation

final class OneItemPresenter {
	weak var view: OneItemViewInput?
    weak var moduleOutput: OneItemModuleOutput?
    
	private let router: OneItemRouterInput
	private let interactor: OneItemInteractorInput
    
    init(router: OneItemRouterInput, interactor: OneItemInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension OneItemPresenter: OneItemModuleInput {
}

extension OneItemPresenter: OneItemViewOutput {
    func getOneItemData() {
        view?.showLoaderView()
        interactor.fetchOneItemData()
    }
    
    func backToAllItems() {
        router.backButtonTapped()
    }
}

extension OneItemPresenter: OneItemInteractorOutput {
    func showEror(error: String) {
        view?.hideLoaderView()
        view?.showErrorAlert(error: error)
    }
    
    func loadData(info: OneItemInfo) {
        view?.hideLoaderView()
        view?.setFetchedData(itemInfo: info)
    }
}
