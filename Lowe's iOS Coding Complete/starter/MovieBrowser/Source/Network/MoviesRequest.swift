//
//  MoviesRequest.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct MoviesRequest {
    
    func getMovies(moviesResource: MoviesResource, completion: @escaping (Result<MovieResult?, NetworkRequestError>) -> Void) {
        let request = ModelRequest(resource: moviesResource)
        request.startRequest { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

