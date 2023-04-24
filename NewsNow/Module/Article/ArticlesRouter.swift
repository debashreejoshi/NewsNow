//
//  ArticlesRouter.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import UIKit

// Define the protocol that the router will conform to
protocol ArticlesRouterProtocol {
    func routeToWebViewController(url: URL)
    func presentError(message: String)
    func refresh()
}

class ArticlesRouter: ArticlesRouterProtocol {
    
    // A reference to the view controller that this router will interact with
    var viewController: ArticlesViewController
    
    // Initialize the router with the given view controller
    init(viewController: ArticlesViewController) {
        self.viewController = viewController
    }
    
    // Navigate to a web view controller with the given URL
    func routeToWebViewController(url: URL) {
        // Instantiate the web view controller from the storyboard
        let webViewController = UIStoryboard(name: "WebView", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        // Pass the URL to the web view controller
            webViewController.url = url
        // Push the web view controller onto the navigation stack
        viewController.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func presentError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        // Present the error alert on the view controller
        viewController.present(alert, animated: true)
    }
    
    // Call the refresh method on the view controller
    func refresh() {
        viewController.refresh()
    }

}

