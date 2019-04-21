//
//  ViewController.swift
//  QRReader
//
//  Created by Sebastian Hette on 17.07.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    // カメラやマイクの入出力を管理するオブジェクトを生成
    private let session = AVCaptureSession()
    
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        //        navigationController?.popViewController(animated: true)
    }
    
   
 
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Restart")
            self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        // カメラやマイクのデバイスそのものを管理するオブジェクトを生成（ここではワイドアングルカメラ・ビデオ・背面カメラを指定）
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                                mediaType: .video,
                                                                position: .back)
        
        // ワイドアングルカメラ・ビデオ・背面カメラに該当するデバイスを取得
        let devices = discoverySession.devices
        
        self.view.backgroundColor = .blue
        self.navigationItem.title = title
        self.navigationController?.navigationBar.barTintColor = .white
     
        //imagem para voltar
        let imageName = "close-icon"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 10, y: 20, width: 50, height: 50)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(imageView)
        
        
        //mira
        let mainImage = UIImage(named:"aim")
        let mainImageView = UIImageView(image:mainImage)
        mainImageView.center = self.view.center
        mainImageView.contentMode = .scaleAspectFit
        self.view.addSubview(mainImageView)
        
      
        if let backCamera = devices.first {
            do {
                
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    
                   
                    let metadataOutput = AVCaptureMetadataOutput()
                    
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.qr]
                        
             
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                        
                        imageView.frame = CGRect(x: 10, y: 35, width: 50, height: 50)
                        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                        imageView.isUserInteractionEnabled = true
                        imageView.addGestureRecognizer(tapGestureRecognizer)
                        view.addSubview(imageView)
                        
                        
                        //mira
                        let mainImage = UIImage(named:"aim")
                        let mainImageView = UIImageView(image:mainImage)
                        mainImageView.center = self.view.center
                        mainImageView.contentMode = .scaleAspectFit
                        self.view.addSubview(mainImageView)
                        
                      
                        self.session.startRunning()
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
        
            if metadata.type != .qr { continue }
            
           
            if metadata.stringValue == nil { continue }
            

            if let url = URL(string: metadata.stringValue!) {
                self.session.stopRunning()
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
                break
            }
        }
    }
}

