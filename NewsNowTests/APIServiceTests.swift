//
//  APIServiceTests.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow

final class APIServiceTests: XCTestCase {

    var apiService: APIService!
        var session: URLSession!

        override func setUp() {
            super.setUp()
            session = URLSession(configuration: .default)
            apiService = APIService(session: session)
        }

        override func tearDown() {
            session = nil
            apiService = nil
            super.tearDown()
        }

        func testFetchArticles() {
            let expectation = self.expectation(description: "Fetch articles should return successfully")
            
            apiService.fetchArticles { result in
                switch result {
                case .success(let articleResponse):
                    XCTAssertNotNil(articleResponse.assets)
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Error fetching articles: \(error.localizedDescription)")
                }
            }
            
            waitForExpectations(timeout: 5, handler: nil)
        }

}
