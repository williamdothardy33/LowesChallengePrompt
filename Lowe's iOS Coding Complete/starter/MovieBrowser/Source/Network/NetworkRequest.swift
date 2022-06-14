//
//  NetworkRequest.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
protocol NetworkRequest {
    associatedtype ModelType
    func decode(data: Data) -> ModelType?
    func startRequest(completion: @escaping (Result<ModelType?, NetworkRequestError>) -> Void)
}

extension NetworkRequest {
    func load(url: URL, completion: @escaping (Result<ModelType?, NetworkRequestError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.error(error.debugDescription)))
                return
            }
            
            /*let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("responseString = \(responseString!)")*/
            //print(httpResponse)
            completion(.success(self.decode(data: data)))
        }.resume()
    }
}
