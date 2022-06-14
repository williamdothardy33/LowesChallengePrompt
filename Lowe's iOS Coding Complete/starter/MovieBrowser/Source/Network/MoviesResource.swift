//
//  MoviesResource.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct MoviesResource: URLResource {
    typealias ModelType = MovieResult
    var url: URL
    
    init() {
        guard let url = URL(string: URLPath.baseMovieURL.rawValue) else {
            print("invalid url")
            fatalError()
        }
        self.init(url: url)
    }
    init(url: URL) {
        self.url = url
    }
}
