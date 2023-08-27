//
//  URLBuilderImpl.swift
//  Internship
//
//  Created by Veronika on 27.08.2023.
//

import Foundation

final class URLBuilderImpl: URLBuilder {
    private var urlComponents: URLComponents?
    
    init() {
        self.urlComponents = URLComponents()
    }
    
    func addScheme(scheme: String) -> URLBuilder {
        urlComponents?.scheme = scheme
        return self
    }
    
    func addHost(host: String) -> URLBuilder {
        urlComponents?.host = host
        return self
    }
    
    func addPath(_ path: String) -> URLBuilder {
        urlComponents?.path = path
        return self
    }
    
//    func addQuery(name: String, value: String) -> URLBuilderImpl {
//        let query = URLQueryItem(name: name, value: value)
//        urlComponents?.queryItems?.append(query)
//        return self
//    }
    
    func build() -> URL? {
        return urlComponents?.url
    }
}
