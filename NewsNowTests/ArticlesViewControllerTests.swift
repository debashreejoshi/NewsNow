//
//  ArticlesViewControllerTests.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow

final class ArticlesViewControllerTests: XCTestCase {

    var viewController: ArticlesViewController!
    
    override func setUp() {
        super.setUp()
        // Create an instance of UIStoryboard using the "Main" storyboard file
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Instantiate an instance of ArticlesViewController using the storyboard and
        // assign it to the viewController property
        viewController = storyboard.instantiateViewController(withIdentifier: "ArticlesViewController") as? ArticlesViewController
        // Load the view hierarchy of ArticlesViewController
        viewController.loadViewIfNeeded()
    }
    
    // Override the default tearDown method to perform some cleanup work after each test
    override func tearDown() {
        // Set the viewController property to nil to release its memory
        viewController = nil
        super.tearDown()
    }

    // Test whether the table view has a data source
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource is ArticlesViewController)
    }
    
    // Test whether the table view has a delegate
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate is ArticlesViewController)
    }
    
    // Test whether the table view outlet is connected
    func testTableViewIsConnectedToOutlet() {
        XCTAssertNotNil(viewController.tableView)
    }
    
    // Test the navigation bar title
    func testNavigationBarTitle() {
        XCTAssertEqual(viewController.navigationItem.title, "NewsNow")
    }
    
    // Test whether the fetchArticles method is called when the view will appear
    func testFetchArticles() {
        let mockViewModel = MockArticlesViewModel()
        viewController.viewModel = mockViewModel
        viewController.viewWillAppear(false)
        XCTAssertTrue(mockViewModel.fetchArticlesCalled)
    }
    
    // Test whether the table view cell is displayed correctly
    func testCellForRowAtIndexPath() {
        let mockViewModel = MockArticlesViewModel()
        mockViewModel.datasource = MockArticlesViewModel.mockData
        viewController.viewModel = mockViewModel
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ArticleTableViewCell
        XCTAssertEqual(cell.headlineLabel.text, "Article 1")
        XCTAssertEqual(cell.byLineLabel.text, "Publisher 1")
        XCTAssertEqual(cell.dateTimeLabel.text, "April 21, 2023")
    }
    
    // Test whether the selectArticle method is called when a table view cell is selected
    func testDidSelectRowAtIndexPath() {
        let mockViewModel = MockArticlesViewModel()
        viewController.viewModel = mockViewModel
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockViewModel.selectArticleCalled)
    }

}
