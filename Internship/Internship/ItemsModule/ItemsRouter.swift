//
//  ItemsRouter.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class ItemsRouter {
    var viewController: UIViewController?
}

extension ItemsRouter: ItemsRouterInput {
    func openOneItemScreen(at index: String) {
        let context = OneItemContext(itemId: index)
        let container = OneItemContainer.assemble(with: context)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
