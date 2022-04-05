//
//  FakeResponseData.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 05/04/2022.
//
import SwiftUI

final class FakeResponseData {
    static let url: URL = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=9aa02db6c7f008370607b92759c620cc&language=en-US&query=turning-red&page=1&include_adult=false")!
    static let responseOK = HTTPURLResponse(url: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=9aa02db6c7f008370607b92759c620cc&language=en-US&query=turning-red&page=1&include_adult=false")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=9aa02db6c7f008370607b92759c620cc&language=en-US&query=turning-red&page=1&include_adult=false")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class MovieError: Error {}
    static let error = MovieError()
    
    static var correctData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "MovieTest", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let incorrectData = "erreur".data(using: .utf8)!
}
