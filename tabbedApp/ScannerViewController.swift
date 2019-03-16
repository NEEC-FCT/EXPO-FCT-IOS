//
//  ViewController.swift
//  QRReader
//
//  Created by Sebastian Hette on 17.07.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import AVFoundation

class  ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    
    var video = AVCaptureVideoPreviewLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating session
        let session = AVCaptureSession()
        
        //Define capture devcie
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch
        {
            print ("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
    
        
        session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObjectTypeQRCode
                {
                    
                  
                    //Send next view
                    DispatchQueue.main.async {
                        
                        let alertController = UIAlertController(title: "Alert", message: "Successo", preferredStyle: .alert)
                        
                        let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                            print("You've pressed default");
                            guard let url = URL(string: object.stringValue) else { return }
                            UIApplication.shared.open(url)
                        }
                        
                        
                        
                        alertController.addAction(action1)
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    
                    
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

