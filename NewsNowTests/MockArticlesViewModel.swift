//
//  MockArticlesViewModel.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow


class MockArticlesViewModel: ArticlesViewModelProtocol {
    
    // A property to hold the data source for the view model.
    var datasource: [ArticleCellViewModel] = []
    
    // Boolean flags to track if fetchArticles() and selectArticle(at:) methods are called.
    var fetchArticlesCalled = false
    var selectArticleCalled = false
    
    // The index of the article that is selected.
    var selectedArticleIndex: Int?
    
    // Method to set fetchArticlesCalled flag to true.
    func fetchArticles() {
        fetchArticlesCalled = true
    }
    
    // Method to set selectArticleCalled flag to true and to set the selectedArticleIndex.
    func selectArticle(at index: Int) {
        selectArticleCalled = true
        selectedArticleIndex = index
    }
    
    // A static method to return an array of mock ArticleCellViewModel objects.
    static var mockData: [ArticleCellViewModel] {
        
        let mockData1 = ArticleCellViewModel(
            title: "Article 1",
            description: "Article description 1",
            date: "April 21, 2023",
            publisher: "Publisher 1",
            thumbnail: "https://www.fairfaxstatic.com.au/content/dam/images/h/0/z/r/b/6/image.imgtype.afrWoodcutAuthorImage.140x140.png/1525680899587.png")
        
        let mockData2 = ArticleCellViewModel(
            title: "Article 2",
            description: "Article description 2",
            date: "April 22, 2023",
            publisher: "Publisher 2",
            thumbnail: "invalid-url")
        
        let mockData3 = ArticleCellViewModel(
            title: "Article 3",
            description: "Article description 3",
            date: "April 20, 2023", publisher: "Publisher 3",
            thumbnail: "https://www.fairfaxstatic.com.au/content/dam/images/h/2/a/v/3/h/image.related.afrArticleLead.1536x1010.p5cvqf.13zzqx.png/1682067078690.jpg")
        
        return [mockData1,mockData2, mockData3]
    }
}


