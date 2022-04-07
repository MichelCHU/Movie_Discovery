//
//  CoredataTest.swift
//  Movie_DiscoveryTests
//
//  Created by Square on 07/04/2022.
//

import XCTest
@testable import Movie_Discovery

class CoredataTest: XCTestCase {
    
    var coreDataManager: CoreDataManager!
    var movie = ["Turning Red"]
    
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

//    func testAddFavoriteMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
//
//        coreDataManager.saveMovie(title: "Turning Red", posterPath: "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg", releaseDate: "2022-03-01")
//
//        XCTAssertTrue(!coreDataManager.movies.isEmpty)
//        XCTAssertTrue(coreDataManager.movies.count == 1)
//        XCTAssertTrue(coreDataManager.movies[0].title! == "Turning Red")
//    }
}
