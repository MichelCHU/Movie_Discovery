//
//  Movie_DiscoveryUITests.swift
//  Movie_DiscoveryUITests
//
//  Created by Square on 04/04/2022.
//

import XCTest
@testable import Movie_Discovery

class Movie_DiscoveryUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testTappedMoviesButtonsShowHomeView() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Movies"].tap()
        
        XCTAssert(app.staticTexts["Now Playing"].exists)
//        XCTAssert(app.staticTexts["Top Rated"].exists)
//        XCTAssert(app.staticTexts["Upcoming"].exists)
//        XCTAssert(app.staticTexts["Popular"].exists)
    }
    
    func testButtonNowPlaying_ShoudldGoingTo_ShowDetail() throws {

        let app = XCUIApplication()
        app.launch()
        app.buttons["Movies"].tap()
        
        XCTAssert(app.staticTexts["Now Playing"].exists)
        
  
    }
    
    func testSearchBar_ByTapping() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Search"].tap()
        
        XCTAssert(app.staticTexts["Search"].exists)
    }
    
    
    func testSearchBar_ByTapping_SearchMovie_TurningRed() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Search"].tap()
        app.tables.searchFields["Search movies"].tap()
        app.searchFields["Search movies"].typeText("Turning Red")
        
    }
    
    func testSearchBar_ByTapping_SearchMovie_NoTurningRed() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Search"].tap()
        app.tables.searchFields["Search movies"].tap()
        app.searchFields["Search movies"].typeText("Turning Red")
        
        XCTAssertFalse(app.staticTexts["Hulk"].exists)
    }
    
    
    func testButtonNowPlaying_ShoudldGoingTo_ShowMovieDetails() throws {

        let app = XCUIApplication()
        app.launch()
        app.buttons["Movies"].tap()
        
        XCTAssert(app.staticTexts["Now Playing"].exists)
        app.buttons["Turning Red"].tap()
        XCTAssert(app.staticTexts["Starring"].exists)
    }
    
    func testButtonNowPlaying_ShoudldGoingTo_ShowMovieDetails_ButtonDone() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Movies"].tap()
        
        XCTAssert(app.staticTexts["Now Playing"].exists)
        app.buttons["Turning Red"].tap()
        XCTAssert(app.staticTexts["Trailers"].exists)
        app.buttons["Official Trailer"].tap()
        app.buttons["Done"].tap()
    }
}
