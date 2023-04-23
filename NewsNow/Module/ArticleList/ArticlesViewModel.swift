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
    
    var datasource: [ArticleCellViewModel] = [] {
        didSet {
            router.refresh()
        }
    }
    var assets: [Asset] = [] {
        didSet {
            datasource = assets.map{ ArticleCellViewModel(asset: $0) }
        }
    }
    
    var errorMessage: String?
    var onFetchCompleted: (() -> Void)?
    var onFetchFailed: (() -> Void)?
    
    var router: ArticlesRouterProtocol
    
    init(apiService: APIServiceProtocol = APIService(), router: ArticlesRouterProtocol) {
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
