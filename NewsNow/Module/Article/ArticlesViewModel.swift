//
//  ArticlesListViewModel.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import Foundation

// Defining a protocol for ArticlesViewModel
protocol ArticlesViewModelProtocol {
    
    // Define properties and methods for the ViewModel
    var datasource: [ArticleCellViewModel] { get }
    func fetchArticles()
    func selectArticle(at index: Int)
}

class ArticlesViewModel: ArticlesViewModelProtocol {
    
    private let apiService: APIServiceProtocol
    private let router: ArticlesRouterProtocol
    
    var datasource: [ArticleCellViewModel] = [] {
        // Setting a didSet observer to refresh the router when the datasource is updated
        didSet {
            router.refresh()
        }
    }
    
    var assets: [Asset] = [] {
        
        // Setting a didSet observer to update the datasource whenever assets are updated
        didSet {
            datasource = assets.map{ ArticleCellViewModel(
                title: $0.headline ?? "",
                description: $0.theAbstract,
                date: $0.formattedTimestamp,
                publisher: $0.byLine,
                
                // The thumbnail URL is determined by getting the 'RelatedImage' object with the smallest width and then getting its 'url' property. If no such object exists, a default empty string is used.
                thumbnail: $0.relatedImages.min { $0.width < $1.width }?.url ?? "") }
        }
    }
    
    var errorMessage: String?
    var onFetchCompleted: (() -> Void)?
    var onFetchFailed: (() -> Void)?
    
    
    // Initializer for ArticlesViewModel
    init(apiService: APIServiceProtocol, router: ArticlesRouterProtocol) {
        self.apiService = apiService
        self.router = router
    }
    
    // Fetches articles using the API service
    func fetchArticles() {
        apiService.fetchArticles { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                
                // Sorting the assets by timestamp and updating the datasource
                self.assets = response.assets?.sorted(by: { $0.timeStamp > $1.timeStamp }) ?? []
                
            case .failure(let error):
                
                // Presenting an error message using the router in case of failure
                self.router.presentError(message: error.localizedDescription)
            }
        }
    }
    
    // Selects an article at a given index and routes to the web view controller
    func selectArticle(at index: Int) {
        let article = assets[index]
        guard let url = URL(string: article.url) else { return }
        router.routeToWebViewController(url: url)
    }
}
