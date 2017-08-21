//
//  WebController.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 21.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import UIKit

class WebController: UIViewController {

    @IBOutlet var webView: UIWebView!

    var redirectUrl: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(URLRequest(url: URL(string: redirectUrl)!))
    }
}
