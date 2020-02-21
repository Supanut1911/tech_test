//
//  WebviewVC.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import WebKit

class WebviewVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var linkurl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: linkurl)
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)
    }
}
