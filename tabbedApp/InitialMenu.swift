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
    
   
    
    @IBAction func horarioClicked(_ sender: Any) {
        startAPP( tab: 0 )
    }
    
    @IBAction func maoClicked(_ sender: Any) {
         startAPP( tab: 2 )
    }
    @IBAction func horclicked(_ sender: Any) {
            startAPP( tab: 0 )
    }
    @IBAction func mapaClicked(_ sender: Any) {
        
        startAPP( tab: 2 )
        
    }
    
    @IBAction func infClicked(_ sender: Any) {
         startAPP( tab: 1)
    }
    
    @IBAction func infoClicked(_ sender: Any) {
        
         startAPP( tab: 1)
    }
    
    @IBAction func camClick(_ sender: Any) {
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "reader")
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    @IBAction func cameraClicked(_ sender: Any) {
        
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "reader")
            self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func razaoClicked(_ sender: Any) {
         startAPP( tab: 3 )
    }
    @IBAction func reasonClicked(_ sender: Any) {
          startAPP( tab: 3 )
    }
    
    func startAPP( tab:Int){
        UserDefaults.standard.set( tab , forKey: "Selected")
        performSegue(withIdentifier: "goTab", sender: nil)
    }
    
    @IBAction func fctClick(_ sender: Any) {
          startAPP( tab: 4 )
    }
    @IBAction func fctClicked(_ sender: Any) {
        startAPP( tab: 4 )
    }
    
    @IBAction func teamClick(_ sender: Any) {
         startAPP( tab: 6 )
    }
    
    @IBAction func nucleClick(_ sender: Any) {
         startAPP( tab: 5 )
    }
    @IBAction func nucleosClicked(_ sender: Any) {
        startAPP( tab: 5 )
    }
    
    @IBAction func teamCliked(_ sender: Any) {
        startAPP( tab: 6 )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Não mostra num iphone 5
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.bounds.size.height{
            case 568:
                print("iPhone 5")
                self.view = Bundle.main.loadNibNamed("Iphone5Initial", owner: self, options: nil)![0] as? UIView
               
            default:
                print("other models")
            }
        }
        
     
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    
}

