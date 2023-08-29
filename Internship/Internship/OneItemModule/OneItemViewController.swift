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
    
    let data = ["Смартфон Apple iPhone 12",
                "55000 ₽",
                "Москва",
                "2023-08-16",
                "Характеристики",
                "Отличное состояние, последняя модель iPhone.",
                "Каналы связи",
                "example1@example.com",
                "+7 (123) 456-7890",
                "ул. Пушкина, д. 1"]
    
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
        
//        oneItemView.configureViewWith(image: "Image", data: data)
    }
}

extension OneItemViewController: OneItemViewInput {
    func setFetchedData(itemInfo: OneItemInfo) {
        print("fetched data:\(itemInfo)")
        oneItemView.configureViewWith(image: "Image", data: itemInfo)
    }
}

