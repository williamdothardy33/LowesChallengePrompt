//
//  URLResource.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

protocol URLResource {
    associatedtype ModelType: Codable
    
    var url: URL { get }
    init(url: URL)
}

extension URLResource {
    func addQueryParameter(key: String, value: String) -> Self {
        var components = URLComponents(url: self.url, resolvingAgainstBaseURL: false)
        var queryItems: [URLQueryItem] = components?.queryItems ?? []
        let query = URLQueryItem(name: key, value: value)
        queryItems.append(query)
        components?.queryItems = queryItems
        guard let queryURL = components?.url else { return self }
        return type(of: self).init(url: queryURL)
    }
    
    func addPathParameter(pathParameter: String) -> Self {
        return type(of: self).init(url: self.url.appendingPathComponent(pathParameter))
    }
}
