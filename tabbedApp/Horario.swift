//
//  Horario.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//


import Foundation
import UIKit

class Horario: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://expofct.neec-fct.com/schedule/")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

