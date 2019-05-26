//
//  BeachViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 20/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudio
import LocalAuthentication

class BeachViewController: UIViewController {

    @IBOutlet weak var scanFID: UIButton!
    @IBOutlet weak var gateView: UIImageView!
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    
    var beachSound: AVAudioPlayer?
    
    var imagesNames = ["Gate1", "Gate2", "Gate3", "Gate4", "Gate5", "Gate6", "Gate7", "Gate8", "Gate9", "Gate10"]
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(RainViewController.back(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        for i in 0..<imagesNames.count{
            images.append(UIImage(named: imagesNames[i])!)
        }
//        beginFaceID()
    }
    
    
    @IBAction func scanFaceID(_ sender: Any) {
        scanFID.addTarget(self, action: #selector(handleFaceId), for: .touchUpInside)
    }
    
    @objc fileprivate func handleFaceId(){
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To have an access to the door we need to check your FaceID") { (wasSuccessful, error) in
                if wasSuccessful{
//                    self.dismiss(animated: true, completion: nil)
                    
                    self.gateView.animationImages = self.images
                    self.gateView.animationDuration = 1
                    self.gateView.animationRepeatCount = 1
                    self.scanFID.alpha = 0
                    self.gateView.startAnimating()
                    self.gateView.image = self.images.last
                    self.playSound()
                }else{
                    Alert.showBasic(title: "Incorrect credentials", msg: "Please try again", vc: self)
                }
            }
        }else{
            Alert.showBasic(title: "FaceID not configured", msg: "Please go to settings", vc: self)
        }
    }
    
    class Alert{
        class func showBasic(title: String, msg: String, vc: UIViewController){
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
    func playSound(){
        let path = Bundle.main.path(forResource: "Sea Waves.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            beachSound = try AVAudioPlayer(contentsOf: url)
            beachSound?.numberOfLoops = 3
            beachSound?.play()
        } catch {
            print("Couldn't load file ☹️")// couldn't load file :(
        }
    }
    
    @IBAction func back(_ sender: UIScreenEdgePanGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
