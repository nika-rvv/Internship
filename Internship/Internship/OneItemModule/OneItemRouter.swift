//
//  OneItemRouter.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class OneItemRouter {
    var viewController: UIViewController?
}

extension OneItemRouter: OneItemRouterInput {
    func backButtonTapped() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
