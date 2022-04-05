//
//  Movie+Bundle.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import Foundation

extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
}

//localte or load the needed resource , system APIs to interact with the resource
extension Bundle {
    
    func loadAndDecodeJSON<T: Decodable>(filename: String) throws -> T? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = CallJSONDecoder.jsonDecoder
        let decodedModel = try jsonDecoder.decode(T.self, from: data)
        return decodedModel
    }
}
