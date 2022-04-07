//
//  FakeServiceResponse.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 05/04/2022.
//

import XCTest

@testable import Movie_Discovery

//class RequestServiceTests: XCTestCase {
//
//    //MARK:- Test
//
//    func testGetData_WhenNoDataIsPassed_ThenShouldReturnFailedCallback() {
//        let session = FakeServiceTest(fakeResponse: FakeResponse(response: nil, data: nil))
//        let requestService = MovieAPI(session: session)
//        let expectation = XCTestExpectation(description: "Wait for queue change.")
//        requestService.searchMovie(query: ["Turning Red"]) { result in
//            guard case .failure(let error) = result else {
//                XCTFail("Test getData method with no data failed.")
//                return
//            }
//            XCTAssertNotNil(error)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
//
//    func testGetData_WhenIncorrectResponseIsPassed_ThenShouldReturnFailedCallback() {
//        let session = FakeServiceTest(fakeResponse: FakeResponse(response: nil, data: nil))
//        let requestService = MovieAPI(session: session)
//        let expectation = XCTestExpectation(description: "Wait for queue change.")
//        requestService.searchMovie(query: "turning-red")  { result in
//            guard case .failure(let error) = result else {
//                XCTFail("Test failed: \(#function)")
//                return
//            }
//            XCTAssertTrue(error == .invalidResponse)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
//
//    func testGetData_WhenUndecodableDataIsPassed_ThenShouldReturnFailedCallback() {
//        let session = FakeServiceTest(fakeResponse: FakeResponse(response: nil, data: nil))
//        let requestService = MovieAPI(session: session)
//        let expectation = XCTestExpectation(description: "Wait for queue change.")
//        requestService.searchMovie(query: "turning-red") { result in
//            guard case .failure(let error) = result else {
//                XCTFail("Test failed: \(#function)")
//                return
//            }
//            XCTAssertTrue(error == .serializationError)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
//
//    func testGetData_WhenCorrectDataIsPassed_ThenShouldReturnSuccededCallback() {
//        let session = FakeServiceTest(fakeResponse: FakeResponse(response: nil, data: nil))
//        let requestService = MovieAPI(session: session)
//        let expectation = XCTestExpectation(description: "Wait for queue change.")
//        requestService.searchMovie(query: "turning-red") { result in
//            guard case .success(let data) = result else {
//                XCTFail("Test failed: \(#function)")
//                return
//            }
//
//            XCTAssertTrue(data.results[0].title == "turning-red")
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
//}
