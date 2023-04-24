//
//  ArticlesListViewModel.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import Foundation

protocol ArticlesViewModelProtocol {
    var datasource: [ArticleCellViewModel] { get }
    func fetchArticles()
    func selectArticle(at index: Int)
}

class ArticlesViewModel: ArticlesViewModelProtocol {
    
    private let apiService: APIServiceProtocol
    private let router: ArticlesRouterProtocol
    
    var datasource: [ArticleCellViewModel] = [] {
        didSet {
            router.refresh()
        }
    }
    var assets: [Asset] = [] {
        didSet {
            datasource = assets.map{ ArticleCellViewModel(
                title: $0.headline ?? "",
                description: $0.theAbstract,
                date: $0.formattedTimestamp,
                publisher: $0.byLine,
                thumbnail: $0.relatedImages.min { $0.width < $1.width }?.url ?? "") }
        }
    }
    
    var errorMessage: String?
    var onFetchCompleted: (() -> Void)?
    var onFetchFailed: (() -> Void)?
    
    
    
    init(apiService: APIServiceProtocol, router: ArticlesRouterProtocol) {
        self.apiService = apiService
        self.router = router
    }
    
    
    func fetchArticles() {
        apiService.fetchArticles { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.assets = response.assets?.sorted(by: { $0.timeStamp > $1.timeStamp }) ?? []
            case .failure(let error):
                self.router.presentError(message: error.localizedDescription)
            }
        }
    }
    
    func selectArticle(at index: Int) {
        let article = assets[index]
        guard let url = URL(string: article.url) else { return }
        router.routeToWebViewController(url: url)
    }
}
