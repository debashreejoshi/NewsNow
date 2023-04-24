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
    
}
