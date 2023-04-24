//
//  APIServiceTests.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow

final class APIServiceTests: XCTestCase {
    
    // Declare variables for the APIService and URLSession
    var apiService: APIService!
    var session: URLSession!
    
    // Set up the initial configuration for each test
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
        apiService = APIService(session: session)
    }
    
    // Tear down the configuration after each test
    override func tearDown() {
        session = nil
        apiService = nil
        super.tearDown()
    }
    
    // Test the function that fetches articles from the API
    func testFetchArticles() {
        // Create an expectation for the test
        let expectation = self.expectation(description: "Fetch articles should return successfully")
        
        // Call the fetchArticles function and check the result
        apiService.fetchArticles { result in
            switch result {
            case .success(let articleResponse):
                // Check that the assets field of the response is not nil
                XCTAssertNotNil(articleResponse.assets)
                expectation.fulfill()
            case .failure(let error):
                // If there is an error, fail the test and print the error description
                XCTFail("Error fetching articles: \(error.localizedDescription)")
            }
        }
        
        // Wait for the expectation to be fulfilled, or time out after 5 seconds
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
