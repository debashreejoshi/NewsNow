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
    
    // Reference to the table view in the interface builder
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    
    // The view model for this view controller
     var viewModel: ArticlesViewModelProtocol?
  
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigation item title
        self.navigationItem.title = "NewsNow"
        
        // Initialize the view model with an API service and router
        viewModel = ArticlesViewModel(apiService: APIService(), router: ArticlesRouter(viewController: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fetch articles from the view model when the view will appear
        viewModel?.fetchArticles()
    }
    
    // Reloads the table view data on the main thread
    func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension ArticlesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of items in the view model's data source array,
        // or 0 if the view model is nil
        return viewModel?.datasource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a reusable cell with the given identifier, or fatalError if dequeue fails
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to dequeue  ArticleTableViewCell")
        }
        
        // Configure the cell with the article at the given index path
        if let article = viewModel?.datasource[indexPath.row] {
            cell.configure(with: article)
        }
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ArticlesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Inform the view model that an article has been selected at the given index path
        viewModel?.selectArticle(at: indexPath.row)
    }
    
}
