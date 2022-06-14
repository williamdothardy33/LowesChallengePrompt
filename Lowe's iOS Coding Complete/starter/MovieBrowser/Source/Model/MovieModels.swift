//
//  MovieModels.swift
//  MovieBrowser
//
//  Created by developer on 6/11/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct MovieResult: Codable {
    let page: Int?
    let total_pages: Int?
    let results: [Movie]?
}

struct Movie: Codable {
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    enum CodingKeys: String, CodingKey {
        case overview, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
