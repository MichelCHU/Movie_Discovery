//
//  DetailLoadingMovie.swift
//  Movie_Discovery
//
//  Created by Square on 05/04/2022.
//

import SwiftUI

class DetailLoadingMovie: ObservableObject {
    
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let fetchService: FecthService
    
    init(fetchService: FecthService = MovieAPI()) {
        self.fetchService = fetchService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.fetchService.fetchMovie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
