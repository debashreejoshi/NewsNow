//
//  ArticlesViewController.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import UIKit
import WebKit

class ArticlesViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    
     var viewModel: ArticlesViewModelProtocol?
  
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NewsNow"
        viewModel = ArticlesViewModel(apiService: APIService(), router: ArticlesRouter(viewController: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchArticles()
    }
    
    
    func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension ArticlesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.datasource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to dequeue  ArticleTableViewCell")
        }
        
        if let article = viewModel?.datasource[indexPath.row] {
            cell.configure(with: article)
        }
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ArticlesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectArticle(at: indexPath.row)
    }
    
}
