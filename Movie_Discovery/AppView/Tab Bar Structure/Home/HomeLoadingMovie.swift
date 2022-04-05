//
//  HomeLoadingMovie.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI

class HomeLoadingMovie: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let fetchService: FecthService
    
    init(fetchService: FecthService = MovieAPI()) {
        self.fetchService = fetchService
    }
    
    func loadMovies(with endpoint: MovieList) {
        self.movies = nil
        self.isLoading = true
        self.fetchService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}


