//
//  BlogPostServiceTests.swift
//  ScottishGaelicTattooHandbookTests
//
//  Created by Chelsea Troy on 7/26/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import XCTest

@testable import ScottishGaelicTattooHandbook

class BlogPostServiceTests: XCTestCase {
    var systemUnderTest: BlogPostService!

    override func setUp() {
        self.systemUnderTest = BlogPostService()
    }

    override func tearDown() {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() {
        //Given
        var blogPosts: [BlogPost]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        //When
        self.systemUnderTest.retrieve(completion: { data, shouldntHappen in
            blogPosts = data
            error = shouldntHappen
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        
        //Then
        XCTAssertNotNil(blogPosts)
        XCTAssertEqual(blogPosts.count, 3)
        for post in blogPosts {
            XCTAssertNotNil(post.title)
            XCTAssertNotNil(post.imageURL)
            XCTAssertNotNil(post.URL)
        XCTAssertTrue(post.URL.hasPrefix("https://gaelic.co/"))
        }
        
        XCTAssertNil(error)
    }

}
