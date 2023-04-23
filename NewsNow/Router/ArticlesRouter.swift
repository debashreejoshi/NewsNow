//
//  ArticlesRouter.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import UIKit

protocol ArticlesRouterProtocol {
    func routeToWebViewController(url: URL)
    func presentError(message: String)
    func refresh()
}

class ArticlesRouter: ArticlesRouterProtocol {
    
    var viewController: ArticlesViewController
    
    init(viewController: ArticlesViewController) {
        self.viewController = viewController
    }
    
    func routeToWebViewController(url: URL) {
        let webViewController = UIStoryboard(name: "WebView", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            webViewController.url = url
        viewController.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func presentError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
    
    func refresh() {
        viewController.refresh()
    }

}

