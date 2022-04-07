//
//  FakeServiceCall.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 05/04/2022.
//

import Foundation
@testable import Movie_Discovery

struct FakeResponse {
    var response: HTTPURLResponse?
    var data: Data?
}

final class FakeServiceTest : FecthService {
    
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let fakeResponse: FakeResponse
    
    init(fakeResponse: FakeResponse) {
        self.fakeResponse = fakeResponse
    }
    
    private func loadURLAndDecode<T: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<T, MovieError>) -> ()) {
        guard URLComponents(url: url, resolvingAgainstBaseURL: false) != nil else {
            completion(.failure(.invalidEndpoint))
            return
        }
    }
    
    func fetchMovies(from endpoint: MovieList, completion: @escaping (Result<MovieResponse, MovieError>) -> Void) {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, completion: completion)
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> Void) {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(id)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "append_to_response": "videos,credits"
        ], completion: completion)
    }
    
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> Void) {
        
        guard let url = URL(string: "\(baseAPIURL)/search/movie") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ], completion: completion)
    }
}
