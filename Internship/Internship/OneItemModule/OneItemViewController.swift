//
//  OneItemViewController.swift
//  Internship
//
//  Created by Veronika on 24.08.2023.
//  
//

import UIKit

final class OneItemViewController: UIViewController {
	private let output: OneItemViewOutput
    
    private let oneItemView = OneItemView()

    init(output: OneItemViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        output.getOneItemData()
	}
}

private extension OneItemViewController {
    func setupViews() {
        view.addSubview(oneItemView)
        oneItemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneItemView.topAnchor.constraint(equalTo: view.topAnchor),
            oneItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oneItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            oneItemView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension OneItemViewController: OneItemViewInput {
    func showLoaderView() {
        oneItemView.isHidden = true
        self.showLoader(animationName: JSONEnum.loadingAnimation.rawValue)
    }
    
    func setFetchedData(itemInfo: OneItemInfo) {
        oneItemView.configureViewWith(data: itemInfo)
    }
    
    func hideLoaderView() {
        self.hideLoader()
        oneItemView.isHidden = false
    }
    
    func showErrorAlert(error: String) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "\(error)",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        self.present(alert, animated: true)
    }
}

