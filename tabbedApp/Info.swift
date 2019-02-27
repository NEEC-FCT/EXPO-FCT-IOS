//
//  Info.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//

import Foundation
import UIKit

class Info: UIViewController , UIWebViewDelegate {


    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://expofct.neec-fct.com/Departamentos/")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        webView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_: UIWebView, shouldStartLoadWith: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        if navigationType == UIWebView.NavigationType.linkClicked {
            UIApplication.shared.open(shouldStartLoadWith.url!, options: [:], completionHandler: nil)
            return false
        }
        return true
    }
    
    
}