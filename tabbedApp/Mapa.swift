//
//  SecondViewController.swift
//  tabbedApp
//
//  Created by NEEC on 23/02/2019.
//  Copyright © 2019 João Veloso. All rights reserved.
//


import UIKit
import MapKit
import JJFloatingActionButton

class Mapa: UIViewController {
    
    
    @IBOutlet weak var NEECLogo: UIButton!
  
    @IBOutlet weak var webView: UIWebView!
    let actionButton = JJFloatingActionButton()
    
    
    @IBAction func NEECClicked(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "EasterEgg")
            self.present(newViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func myHandler(alert: UIAlertAction){
        if( CheckInternet.Connection() == false)
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: myHandler)
         
            
            controller.addAction(ok)
        
            
            present(controller, animated: true, completion: nil)
        }
        else{
            let url = URL (string: "https://www.google.com/maps/d/viewer?mid=1LC7hMeFmnZ8cj4XGiMAEBam7WHZZIn3k&ll=38.66073135349911%2C-9.205763350000097&z=17")
            let requestObj = URLRequest(url: url!)
            webView.loadRequest(requestObj)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHandler(alert: UIAlertAction(title: "OK", style: .default, handler: myHandler))
       
        let url = URL (string: "https://www.google.com/maps/d/viewer?mid=1LC7hMeFmnZ8cj4XGiMAEBam7WHZZIn3k&ll=38.66073135349911%2C-9.205763350000097&z=17")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        
        
        
        actionButton.addItem(title: "Equipa", image: UIImage(named: "team")?.withRenderingMode(.alwaysTemplate)) { item in
            
            let url = URL (string: "https://expofct.neec-fct.com/equipa/about.html")
            let requestObj = URLRequest(url: url!)
            self.webView.loadRequest(requestObj)
            self.actionButton.isHidden = true
            self.NEECLogo.isHidden = true
            
            
        }
        
        actionButton.addItem(title: "Scan", image: UIImage(named: "qrcode")?.withRenderingMode(.alwaysTemplate)) { item in
            DispatchQueue.main.async {
                
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "reader")
                    self.present(newViewController, animated: true, completion: nil)
                
            }
        }
        
        
        view.addSubview(actionButton)
       
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
               actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65).isActive = true
        } else {
            // Fallback on earlier versions
            actionButton.display(inViewController: self)
        }
     

       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

