//
//  HomeViewControllerTests.swift
//  ScottishGaelicTattooHandbookTests
//
//  Created by Chelsea Troy on 7/31/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import ScottishGaelicTattooHandbook

class HomeViewControllerTests: XCTestCase {
var systemUnderTest: HomeViewController!

override func setUp() {
    super.setUp()
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    self.systemUnderTest = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
    
    UIApplication.shared.windows
        .filter { $0.isKeyWindow }
        .first!
        .rootViewController = self.systemUnderTest
    
    XCTAssertNotNil(self.systemUnderTest.view)
}

func testTableView_loadsBirds() {
    //Given
    let mockBlogPostService = MockBlogPostService()
    let mockBlogPosts = [
        BlogPost(title: "First Title", imageURL: "example.com", URL: "example.com"),
        BlogPost(title: "Second Title", imageURL: "example.com", URL: "example.com"),
        BlogPost(title: "Third Title", imageURL: "example.com", URL: "example.com")
    ]
    mockBlogPostService.mockBlogPosts = mockBlogPosts
    
    self.systemUnderTest.viewDidLoad()
    self.systemUnderTest.blogPostService = mockBlogPostService
    
    XCTAssertEqual("Coming soon...", systemUnderTest.firstBlogPostTitle.text)
    XCTAssertEqual("Coming soon...", systemUnderTest.secondBlogPostTitle.text)
    XCTAssertEqual("Coming soon...", systemUnderTest.thirdBlogPostTitle.text)

    
    //When
    self.systemUnderTest.viewWillAppear(false)
    
    //Then
    XCTAssertEqual("First Title", systemUnderTest.firstBlogPostTitle.text)
    XCTAssertEqual("Second Title", systemUnderTest.secondBlogPostTitle.text)
    XCTAssertEqual("Third Title", systemUnderTest.thirdBlogPostTitle.text)

}
    
    class MockBlogPostService: BlogPostService {
        var mockBlogPosts: [BlogPost]?
        var mockError: Error?
        
        override func retrieve(completion: @escaping ([BlogPost]?, Error?) -> ()) {
                completion(mockBlogPosts, mockError)
        }

    }
}
