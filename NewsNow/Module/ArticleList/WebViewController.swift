//
//  WebViewController.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import UIKit
import WebKit

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""

        if let url = url {
            webView.load(URLRequest(url: url))
        }
    }
}
