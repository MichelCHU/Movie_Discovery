//
//  FakeServiceResponse.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 05/04/2022.
//

import XCTest

@testable import Movie_Discovery

class RequestServiceTests: XCTestCase {

    private let fetchData: MovieAPI = .init()
    private let sessionConfiguration: URLSessionConfiguration = {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolFake.self]
        return sessionConfiguration
    }()

    func testGetData_WhenNoDataIsPassed_ThenShouldReturnFailedCallback() {
        URLProtocolFake.fakeURLs = [FakeResponseData.url: (nil, nil, FakeResponseData.error)]
        //        let fakeSession = URLSession(configuration: sessionConfiguration)
        //        let fetchData = MovieAPI(session: fakeSession)
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        fetchData.searchMovie(query: "turning-red") { result in
            guard case .failure(let error) = result else {
                XCTFail("No data")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetData_WhenIncorrectResponseIsPassed_ThenShouldReturnFailedCallback() {
        URLProtocolFake.fakeURLs = [FakeResponseData.url: (FakeResponseData.incorrectData, FakeResponseData.responseOK, nil)]
        //        let fakeSession = URLSession(configuration: sessionConfiguration)
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        fetchData.searchMovie(query: "turning-red")  { result in
            guard case .failure(let error) = result else {
                XCTFail("Invalid response")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetData_WhenUndecodableDataIsPassed_ThenShouldReturnFailedCallback() {
        URLProtocolFake.fakeURLs = [FakeResponseData.url: (FakeResponseData.incorrectData, FakeResponseData.responseOK, nil)]
        //        let fakeSession = URLSession(configuration: sessionConfiguration)
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        fetchData.searchMovie(query: "turning-red") { result in
            guard case .failure(let error) = result else {
                XCTFail("Failed to decode data")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetData_WhenCorrectDataIsPassed_ThenShouldReturnSuccededCallback() {
        URLProtocolFake.fakeURLs = [FakeResponseData.url: (FakeResponseData.correctData, FakeResponseData.responseOK, nil)]
        //        let fakeSession = URLSession(configuration: sessionConfiguration)
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        fetchData.searchMovie(query: "turning-red") { result in
            guard case .success(let data) = result else {
                XCTFail("Test getData method with correct data failed.")
                return
            }

            XCTAssertTrue(data.results[0].title == "turning-red")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
