//
//  SecondViewController.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//


import UIKit

class tabBarController: UITabBarController {
    
    
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            var tab = UserDefaults.standard.integer(forKey: "Selected")
            freshLaunch = false
            
            if( tab == 5 || tab == 6 ){
                   tab = 2
            }
            
            self.selectedIndex = tab // 5th tab
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

