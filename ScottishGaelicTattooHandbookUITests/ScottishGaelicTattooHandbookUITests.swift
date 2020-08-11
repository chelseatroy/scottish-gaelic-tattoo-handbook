//
//  ScottishGaelicTattooHandbookUITests.swift
//  ScottishGaelicTattooHandbookUITests
//
//  Created by Chelsea Troy on 6/27/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import XCTest

class ScottishGaelicTattooHandbookUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBlogPostSlidesUp_onTappingBlogPostPreview_andSlidesDown_whenDismissed() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = app.scrollViews
        
        let element = scrollViewsQuery.children(matching: .other).element(boundBy: 0)
        element.children(matching: .other).element(boundBy: 4).children(matching: .other).element(boundBy: 0).tap()
        
        let doneButton = app.buttons["Done"]
        XCTAssert(doneButton.isHittable)

        doneButton.tap()
        sleep(1)
        XCTAssertFalse(doneButton.isHittable)
        
        element.children(matching: .other).element(boundBy: 5).children(matching: .other).element(boundBy: 0).tap()
        
        XCTAssert(doneButton.isHittable)

        doneButton.tap()
        sleep(1)
        XCTAssertFalse(doneButton.isHittable)
        
        element.swipeUp()
        element.children(matching: .other).element(boundBy: 6).children(matching: .other).element(boundBy: 0).tap()
        
        XCTAssert(doneButton.isHittable)

        doneButton.tap()
        sleep(1)
        XCTAssertFalse(doneButton.isHittable)

    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
