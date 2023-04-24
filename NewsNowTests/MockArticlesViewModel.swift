//
//  MockArticlesViewModel.swift
//  NewsNowTests
//
//  Created by Debashree Joshi on 24/4/2023.
//

import XCTest
@testable import NewsNow


class MockArticlesViewModel: ArticlesViewModelProtocol {
    
    var datasource: [ArticleCellViewModel] = []
    var fetchArticlesCalled = false
    var selectArticleCalled = false
    var selectedArticleIndex: Int?
    
    func fetchArticles() {
        fetchArticlesCalled = true
    }
    
    func selectArticle(at index: Int) {
        selectArticleCalled = true
        selectedArticleIndex = index
    }
    
    static var mockData: [ArticleCellViewModel] {
        let mockData1 = ArticleCellViewModel(title: "Article 1", description: "Article description 1", date: "April 21, 2023", publisher: "Publisher 1", thumbnail: "https://www.fairfaxstatic.com.au/content/dam/images/h/0/z/r/b/6/image.imgtype.afrWoodcutAuthorImage.140x140.png/1525680899587.png")
        let mockData2 = ArticleCellViewModel(title: "Article 2", description: "Article description 2", date: "April 22, 2023", publisher: "Publisher 2", thumbnail: "invalid-url")
        let mockData3 = ArticleCellViewModel(title: "Article 3", description: "Article description 3", date: "April 20, 2023", publisher: "Publisher 3", thumbnail: "https://www.fairfaxstatic.com.au/content/dam/images/h/2/a/v/3/h/image.related.afrArticleLead.1536x1010.p5cvqf.13zzqx.png/1682067078690.jpg")
        
        return [mockData1,mockData2, mockData3]
    }
}


