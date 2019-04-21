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
    
    
    
        var url = URL (string: "https://www.google.com/maps/d/u/0/viewer?mid=1LC7hMeFmnZ8cj4XGiMAEBam7WHZZIn3k&ll=38.661303032631146%2C-9.205898544352294&z=16&fbclid=IwAR0JsCu_NmFOWYDhKhShINItBHHvSc1kMs3gF8FJRkzS-4gsku-MJmmKrSA")
    
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
            let controller = UIAlertController(title: "Sem internet" , message: "Esta aplicação necessita de internet", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: myHandler)
         
            
            controller.addAction(ok)
        
            
            present(controller, animated: true, completion: nil)
        }
        else{
            let url = URL (string: "https://www.google.com/maps/d/u/0/viewer?mid=1EBVZIb43YRKtlhJZFm1m_TxBao4xNeOy&ll=38.660950082602646%2C-9.20509986148852&z=17&fbclid=IwAR3yFGm9cWSVVxGmsXrm9Ji6KDPSxkfPn5qBi2UHg1gR6i0Yk4IsFsYXIbE")
            let requestObj = URLRequest(url: url!)
            webView.loadRequest(requestObj)
        }
    }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHandler(alert: UIAlertAction(title: "OK", style: .default, handler: myHandler))
       
    
        
        let tab = UserDefaults.standard.integer(forKey: "Selected")
        
        if tab == 5 {
            url = URL (string: "https://www.google.com/maps/d/u/0/viewer?mid=1yiEFH_jHV-7Ea4S6VlxUhG_WPkFdopPv&ll=38.661187223123896%2C-9.206034335656113&z=17&fbclid=IwAR3P-EjfRYGOFypYDXFWjtxA17VarxwVlN0DFfgOllsnp3IYajAEvowhqRA" )
        }
        else if tab == 6 {
            url = URL (string: "https://expofct.neec-fct.com/equipa/about.html" )
            self.NEECLogo.isHidden = true
            self.actionButton.isHidden = true
        }
        

        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        
        
        
        actionButton.addItem(title: "Todos", image: UIImage(named: "mapFAB")?.withRenderingMode(.alwaysTemplate)) { item in

            self.url = URL (string:   "https://www.google.com/maps/d/u/0/viewer?mid=1LC7hMeFmnZ8cj4XGiMAEBam7WHZZIn3k&ll=38.661303032631146%2C-9.205898544352294&z=16&fbclid=IwAR0JsCu_NmFOWYDhKhShINItBHHvSc1kMs3gF8FJRkzS-4gsku-MJmmKrSA" )
            let requestObj = URLRequest(url: self.url!)
            self.webView.loadRequest(requestObj)
        }
        
        actionButton.addItem(title: "Núcleos", image: UIImage(named: "neecFAB")?.withRenderingMode(.alwaysTemplate)) { item in
            self.url = URL (string: "https://www.google.com/maps/d/u/0/viewer?mid=1yiEFH_jHV-7Ea4S6VlxUhG_WPkFdopPv&ll=38.661187223123896%2C-9.206034335656113&z=17&fbclid=IwAR3P-EjfRYGOFypYDXFWjtxA17VarxwVlN0DFfgOllsnp3IYajAEvowhqRA" )
            let requestObj = URLRequest(url: self.url!)
            self.webView.loadRequest(requestObj)
        }
        
        actionButton.addItem(title: "Atividades", image: UIImage(named: "atiFAB")?.withRenderingMode(.alwaysTemplate)) { item in
            self.url = URL (string: "https://www.google.com/maps/d/u/0/viewer?mid=1EBVZIb43YRKtlhJZFm1m_TxBao4xNeOy&ll=38.660950082602646%2C-9.20509986148852&z=17&fbclid=IwAR3yFGm9cWSVVxGmsXrm9Ji6KDPSxkfPn5qBi2UHg1gR6i0Yk4IsFsYXIbE" )
            let requestObj = URLRequest(url: self.url!)
            self.webView.loadRequest(requestObj)
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

