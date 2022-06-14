//
//  ImageRequest.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
}

extension ImageRequest: NetworkRequest {
    
    func decode(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func startRequest(completion: @escaping (Result<UIImage?, NetworkRequestError>) -> Void) {
        load(url: url, completion: completion)
    }
}
