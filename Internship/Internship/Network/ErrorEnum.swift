//
//  ErrorEnum.swift
//  Internship
//
//  Created by Veronika on 31.08.2023.
//

import Foundation

enum NetworkResponse: String {
    case wrongURL = "Неверный url"
    case noData = "Ответ возвращен без данных для декодирования"
    case unableToDecode = "Мы не смогли расшифровать ответ"
}
