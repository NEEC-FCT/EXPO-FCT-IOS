//
//  EasterEgg.swift
//  tabbedApp
//
//  Created by NEEC on 16/03/2019.
//  Copyright © 2019 MAGNUMIUM. All rights reserved.
//


import Foundation
import UIKit

class EasterEgg: UIViewController , UIWebViewDelegate {
    
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
            let url = URL (string: "https://flappycreator.com/flappy.php?id=5c8d64cac3661")
            let requestObj = URLRequest(url: url!)
            webView.loadRequest(requestObj)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("https://flappycreator.com/flappy.php?id=5c8d64cac3661")
        myHandler(alert: UIAlertAction(title: "OK", style: .default, handler: myHandler))
        let url = URL (string: "https://flappycreator.com/flappy.php?id=5c8d64cac3661")
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
