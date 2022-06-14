//
//  ImageCache.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit
class ImageCache {
    static let shared = ImageCache()
    private init () {}
    
    let cache: NSCache<NSString, UIImage> = NSCache()
    
    func addImage(key: NSString, image: UIImage) {
        self.cache.setObject(image, forKey: key)
    }
    func getImage(key: NSString) -> UIImage? {
        return self.cache.object(forKey: key)
    }
    
    func loadImage(from urlString: String, completionHandler: @escaping (Result<UIImage?, NetworkRequestError>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let imageUrl = urlString as NSString
        if let cachedImage = self.getImage(key: imageUrl) {
            DispatchQueue.main.async {
                completionHandler(.success(cachedImage))
            }
        } else {
            ImageRequest(url: url).startRequest { result in
                switch (result) {
                case .success(let image):
                    if let image = image {
                        self.cache.setObject(image, forKey: urlString as NSString)
                    }
                case .failure(_): break
                
                }
                completionHandler(result)
            }
        }
    }
}
