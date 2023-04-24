//
//  ArticleTableViewCellTests.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//



import XCTest
import SDWebImage
@testable import NewsNow

final class ArticleTableViewCellTests: XCTestCase {
    
    var cell: ArticleTableViewCell!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // Instantiate ArticlesViewController and load view hierarchy and outlets.

        let articlesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesViewController") as! ArticlesViewController
        _ = articlesVC.view // This will trigger the loading of the view hierarchy and outlets, including the table view.
        
        // Dequeue ArticleTableViewCell for first row of the first section.
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = articlesVC.tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        self.cell = cell
        
    }
    
    override func tearDownWithError() throws {
        cell = nil
        try super.tearDownWithError()
    }
    
    func testConfigure() {
        // Given
        let article = MockArticlesViewModel.mockData[2]
        
        // When
        cell.configure(with: article)
        
        // Then
        // Assert that the labels are properly configured with the data from the article.
        XCTAssertEqual(cell.headlineLabel.text, "Article 3")
        XCTAssertEqual(cell.abstractLabel.text, "Article description 3")
        XCTAssertEqual(cell.byLineLabel.text, "Publisher 3")
        XCTAssertEqual(cell.dateTimeLabel.text, "April 20, 2023")
    }
    
    func testConfigure_withInvalidImageUrl() {
        // Given
        let article = MockArticlesViewModel.mockData[1]
        
        // When
        cell.configure(with: article)
        
        // Then
        // Assert that the labels are properly configured with the data from the article.
        XCTAssertEqual(cell.headlineLabel.text, "Article 2")
        XCTAssertEqual(cell.abstractLabel.text, "Article description 2")
        XCTAssertEqual(cell.byLineLabel.text, "Publisher 2")
        XCTAssertEqual(cell.dateTimeLabel.text, "April 22, 2023")
        // Assert that the relatedImage property is nil when the thumbnail url is invalid.
        XCTAssertNil(cell.relatedImage.image)
    }
}
