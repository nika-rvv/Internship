//
//  URLBuilder.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation

protocol URLBuilder {
    func addScheme(scheme: String) -> URLBuilder
    func build() -> URL?
    func addHost(host: String) -> URLBuilder
    func addPath(_ path: String) -> URLBuilder
}
