//
//  MovieVM.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
class MovieVM {
    var movie: Movie
    
    var title: String {
        movie.title ?? "default title"
    }
    
    var releaseDate: String {
        movie.releaseDate ?? "00-00-00"
    }
    
    var rating: Double {
        movie.voteAverage ?? 0.0
    }

    var posterPath: String? {
        movie.posterPath
    }
    
    var overview: String? {
        movie.overview
    }
    
    var releasedDateSearch: String? {
        if let releaseDate = movie.releaseDate {
            if let date = dateFormatIn.date(from: releaseDate) {
                return dateFormatSearch.string(from: date)
            }
        }
        return "Unknown"
    }
    var releaseDateDetails: String {
        if let releaseDate = movie.releaseDate {
            if let date = dateFormatIn.date(from: releaseDate) {
                return "Release Date: " + dateFormatDetails.string(from: date)
            }
        }
        return "Unknown"
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
