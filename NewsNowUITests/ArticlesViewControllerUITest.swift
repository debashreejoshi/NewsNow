//
//  ArticlesViewControllerUITest.swift
//  NewsNowUITests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow

final class ArticlesViewControllerUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testArticleDetailViewIsDisplayed() {
        // Navigate to the first article in the list
        let firstArticleCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstArticleCell.waitForExistence(timeout: 5))
        firstArticleCell.tap()
        
        // Verify that the article detail view is displayed
        XCTAssertTrue(app.navigationBars.element.exists)
    }
    
    func testRefreshingUpdatesArticleList() {
        // Wait for the table view to appear
        let articlesTableView = app.tables.element
        XCTAssertTrue(articlesTableView.waitForExistence(timeout: 5))
        
        // Swipe down to trigger refreshing
        articlesTableView.swipeDown()
        
        // Wait for the refreshing to finish
        XCTAssertTrue(articlesTableView.waitForExistence(timeout: 5))
    }
    
//    func testTappingOnArticleNavigatesToCorrectURL() {
//        // Create mock implementations of APIServiceProtocol and ArticlesRouterProtocol
//        let mockApiService = MockAPIService()
//        let mockArticlesRouter = MockArticlesRouter()
//
//        // Create an instance of ArticlesViewModel with the mock implementations
//        let articlesViewModel = ArticlesViewModel(apiService: mockApiService, router: mockArticlesRouter)
//
//        // Fetch articles and wait for completion
//        articlesViewModel.fetchArticles()
//        mockApiService.fetchCompletionHandler?(.success(mockApiService.mockResponse))
//        XCTAssertTrue(mockArticlesRouter.refreshCalled)
//
//        // Get the URL of the article from the view model
//        let article = articlesViewModel.assets[0]
//        let url = article.url
//
//        // Open the article URL in Safari
//        app.openURL(URL(string: url)!)
//
//        // Wait for the Safari app to open
//        let safariApp = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
//        XCTAssertTrue(safariApp.waitForExistence(timeout: 10))
//
//        // Verify that the correct URL is displayed in Safari
//        XCTAssertTrue(safariApp.navigationBars.buttons.element(boundBy: 0).waitForExistence(timeout: 10))
//        XCTAssertTrue(safariApp.links[url].exists)
//    }

}
