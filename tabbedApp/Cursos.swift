//
//  Cursos.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 MAGNUMIUM. All rights reserved.
//

import Foundation
import UIKit

class Cursos: UIViewController {
    

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        let url = URL (string: "https://expofct.neec-fct.com/cursos/")
        let requestObj = URLRequest(url: url!)
        webview.loadRequest(requestObj)
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

