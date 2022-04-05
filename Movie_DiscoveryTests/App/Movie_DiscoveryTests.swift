//
//  Movie_DiscoveryTests.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 04/04/2022.
//

import XCTest
@testable import Movie_Discovery

class Movie_DiscoveryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func TestApiErrorDescription_WhenErrorIsInvalidEndpoint() {
        let apiError = MovieError.invalidEndpoint
        
        XCTAssertTrue(apiError.localizedDescription == "Invalid endpoint")
    }
    
    func TestApiErrorDescription_WhenErrorFetchData() {
        let apiError = MovieError.apiError
        
        XCTAssertTrue(apiError.localizedDescription == "Failed to fetch data")
    }
    
    func TestApiErrorDescription_WhenErrorIsInvalidResponse() {
        let apiError = MovieError.invalidResponse
        
        XCTAssertTrue(apiError.localizedDescription == "Invalid response")
    }
    
    func TestApiErrorDescription_WhenErrorIsNoData() {
        let apiError = MovieError.noData
        
        XCTAssertTrue(apiError.localizedDescription == "No data")
    }
    
    func TestApiErrorDescription_WhenErrorIsSerializationError() {
        let apiError = MovieError.serializationError
        
        XCTAssertTrue(apiError.localizedDescription == "Failed to decode data")
    }

}
