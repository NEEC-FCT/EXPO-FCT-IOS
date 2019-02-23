//
//  SecondViewController.swift
//  tabbedApp
//
//  Created by Sebastian Hette on 07.11.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
import MapKit

class Mapa: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        let span:MKCoordinateSpan = MKCoordinateSpanMake( 0.01 , 0.01)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(38.661307,  -9.207192)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

