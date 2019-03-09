//
//  SecondViewController.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//


import UIKit
import MapKit

class Mapa: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL (string: "https://www.google.com/maps/d/viewer?mid=1LC7hMeFmnZ8cj4XGiMAEBam7WHZZIn3k&ll=38.66073135349911%2C-9.205763350000097&z=17")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
       // webView.delegate = self
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

