//
//  Cursos.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//


import Foundation
import UIKit

class InitialMenu: UIViewController  {
    
    
    @IBAction func mapaClicked(_ sender: Any) {
        
        startAPP( tab: 2 )
    }
    
    
    @IBAction func infoClicked(_ sender: Any) {
        
         startAPP( tab: 1)
    }
    
    @IBAction func cameraClicked(_ sender: Any) {
        
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "reader")
            self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func reasonClicked(_ sender: Any) {
          startAPP( tab: 3 )
    }
    
    func startAPP( tab:Int){
        UserDefaults.standard.set( tab , forKey: "Selected")
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "tabBar")
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func fctClicked(_ sender: Any) {
        startAPP( tab: 4 )
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    
}

