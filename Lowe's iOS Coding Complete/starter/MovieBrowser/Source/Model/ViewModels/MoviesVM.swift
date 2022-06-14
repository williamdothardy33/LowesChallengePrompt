//
//  MoviesVM.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MoviesVM {
    var queryResource: MoviesResource? {
        didSet {
            if let resource = queryResource {
                getMovies(moviesResource: resource)
            }
        }
    }
    
    var pageResource: MoviesResource? {
        didSet {
            if let resource = pageResource {
                getNext(moviesResource: resource)
            }
        }
    }
    
    var isFetching = false
    var page: Int? = 1
    var totalPages: Int?
    private(set) var movies: [MovieVM]? {
        didSet {
            handleModelChange()
        }
    }
    
    var handleModelChange: () -> Void = { print("this hasn't been set yet") }
    
    func getMovies(moviesResource: MoviesResource) {
        totalPages = nil
        page = 1
        MoviesRequest().getMovies(moviesResource: moviesResource, completion: {
            result in
            switch result {
            case .success(let movieResult):
                if let movieResult = movieResult, let movies = movieResult.results {
                    self.totalPages = movieResult.total_pages
                    let moviesVM = movies.map {
                        MovieVM(movie: $0)
                    }
                    self.movies =  moviesVM
                }
                
            case .failure(_):
                self.handleNoMovies()
            }
        })
    }
    
    func getNext(moviesResource: MoviesResource) {
        isFetching = true
        MoviesRequest().getMovies(moviesResource: moviesResource, completion: {
            result in
            switch result {
            case .success(let movieResult):
                if let movieResult = movieResult, let movies = movieResult.results {
                    self.page = movieResult.page
                    let moviesVM = movies.map {
                        MovieVM(movie: $0)
                    }
                    self.movies = [self.movies, moviesVM].compactMap {
                        $0
                    }.reduce([]) {
                        $0 + $1
                    }
                }
                self.isFetching = false
                
            case .failure(_):
                self.handleNoMovies()
            }
        })
    }
    
    func handleNoMovies() {
        return
    }
    
}
