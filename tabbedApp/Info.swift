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
    
    func myHandler(alert: UIAlertAction){
        if( CheckInternet.Connection() == false)
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: myHandler)
            
            
            controller.addAction(ok)
            
            
            present(controller, animated: true, completion: nil)
        }
        else{
            let url = URL (string: "https://expofct.neec-fct.com/Departamentos/")
            let requestObj = URLRequest(url: url!)
            webView.loadRequest(requestObj)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myHandler(alert: UIAlertAction(title: "OK", style: .default, handler: myHandler))
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
