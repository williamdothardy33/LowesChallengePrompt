//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var vm: MovieVM?
    var movieImage: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.posterImage.image = self.movieImage
            }
        }
    }
    
    override func viewDidLoad() {
        getMovieImage()
        populateUI()
    }
    
    private func populateUI() {
        self.releaseLabel.text = self.vm?.releaseDateDetails
        self.titleLabel.text = self.vm?.title
        self.overviewLabel.text = self.vm?.overview
        self.posterImage.image = UIImage(named: "placeholder")
    }
    
    private func getMovieImage() {
        guard let path = self.vm?.posterPath else {
            return
        }
        let movieImageResource = MovieImageResource().addPathParameter(pathParameter: path)
        let urlString = movieImageResource.url.absoluteString
        
        ImageCache.shared.loadImage(from: urlString) {
            result in
            switch result {
            case .success(let image):
                self.movieImage = image
            default:
                print("no image found")
            }
        }
    }
}
