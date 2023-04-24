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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ArticlesViewController") as? ArticlesViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource is ArticlesViewController)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate is ArticlesViewController)
    }
    
    func testTableViewIsConnectedToOutlet() {
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testNavigationBarTitle() {
        XCTAssertEqual(viewController.navigationItem.title, "NewsNow")
    }
    
    func testFetchArticles() {
        let mockViewModel = MockArticlesViewModel()
        viewController.viewModel = mockViewModel
        viewController.viewWillAppear(false)
        XCTAssertTrue(mockViewModel.fetchArticlesCalled)
    }
    
    func testCellForRowAtIndexPath() {
        let mockViewModel = MockArticlesViewModel()
        mockViewModel.datasource = MockArticlesViewModel.mockData
        viewController.viewModel = mockViewModel
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ArticleTableViewCell
        XCTAssertEqual(cell.headlineLabel.text, "Article 1")
        XCTAssertEqual(cell.byLineLabel.text, "Publisher 1")
        XCTAssertEqual(cell.dateTimeLabel.text, "April 21, 2023")
    }
    
    func testDidSelectRowAtIndexPath() {
        let mockViewModel = MockArticlesViewModel()
        viewController.viewModel = mockViewModel
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockViewModel.selectArticleCalled)
    }

}
