//
//  SearchBar.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI
import Combine
import Foundation

class SearchingBar: ObservableObject {
    
    @Published var query = ""
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    //AnyCancellable = control how long a given subscrition should alive and active
    private var subscriptionToken: AnyCancellable?
    private let fetchService: FecthService
    
    var isEmptyResults: Bool {
        !self.query.isEmpty && self.movies != nil && self.movies!.isEmpty
    }
    
    init(fetchService: FecthService = MovieAPI()) {
        self.fetchService = fetchService
    }
    
    func startObserve() {
        guard subscriptionToken == nil else { return }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                self?.error = nil
                return text
                // throttle show the most recent or first element published by the editor
                // sink received and print published on the console and flux don't fail
        }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in self?.search(query: $0) }
    }
    
    func search(query: String) {
        self.movies = nil
        self.isLoading = false
        self.error = nil
        
        guard !query.isEmpty else {
            return
        }
        
        self.isLoading = true
        self.fetchService.searchMovie(query: query) {[weak self] (result) in
            guard let self = self, self.query == query else { return }
            
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    // Deinitialization = similar to init but only avaible on class type
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
