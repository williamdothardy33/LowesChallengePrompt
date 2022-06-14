//
//  MovieImageResource.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

struct MovieImageResource: URLResource {
    typealias ModelType = Data
    
    var url: URL
    
    init() {
        guard let url = URL(string: URLPath.baseImageURL.rawValue) else {
            print("invalid url")
            fatalError()
        }
        self.init(url: url)
    }
    init(url: URL) {
        self.url = url
    }
}
