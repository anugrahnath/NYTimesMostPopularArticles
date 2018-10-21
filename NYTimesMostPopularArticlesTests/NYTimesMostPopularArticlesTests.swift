//
//  NYTimesMostPopularArticlesTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import XCTest
@testable import NYTimesMostPopularArticles

class NYTimesMostPopularArticlesTests: XCTestCase {

    
    let featuredArticleJSON = [Constants.url: "https://www.google.com",
                               Constants.typeOfMaterial: "Article",
                               Constants.snippet: "Unit Test Snippet",
                               Constants.abstract: "Unit Test Abstract",
                               Constants.leadParagraph: "Unit Test Lead Paragraph",
                               Constants.section: "Unit Test Section",
                               Constants.title: "Unit Test Title",
                               Constants.publishedDate: "2017-01-28"]
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFeaturedArticle() {
        do {
            _ = try FeaturedArticle(json: featuredArticleJSON)
        } catch {
            XCTAssert(false)
        }
    }

}
