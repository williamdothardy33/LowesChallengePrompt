//
//  ModelRequest.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class ModelRequest<Resource: URLResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ModelRequest: NetworkRequest {
    func decode(data: Data) -> Resource.ModelType? {
        return try? JSONDecoder().decode(Resource.ModelType.self, from: data)
    }
    
    func startRequest(completion: @escaping (Result<Resource.ModelType?, NetworkRequestError>) -> Void) {
        load(url: resource.url, completion: completion)
    }
}
