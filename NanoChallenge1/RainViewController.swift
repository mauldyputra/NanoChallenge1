//
//  RainViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 19/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class RainViewController: UIViewController {

    
    @IBOutlet weak var background: UIView!
    
    var rainSound: AVAudioPlayer?
    
    var listCircle : [UIView] = []
    var tempX : Double = 0.0
    var tempY : Double = 0.0
    var lay : Bool = false
    var motion = CMMotionManager()
    var timer: Timer!
    var seconds : Int = 0
    
    var customAnim = CustomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...600{
            createBuble()
        }
    }
    
    func degrees(radians:Double) -> Double {
        return 180 / .pi * radians
    }
    override func viewDidAppear(_ animated: Bool) {
        gyro()
    }
    
    func gyro(){
        if motion.isDeviceMotionAvailable{
            motion.deviceMotionUpdateInterval = 0.1
            motion.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, errot) in
                self.handleDeviceMotionUpdate(deviceMotion: data!)
            }
        }
    }
    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion) {
        let attitude = deviceMotion.attitude
        
        let pitch = degrees(radians: attitude.pitch)
        
        if pitch < 15 {
            lay = false
            print(seconds)
            if seconds <= 600{
                seconds = 0
                customAnim.fadeIn(view: background)
            }
            for mUI in listCircle{
                customAnim.fadeOut(view: mUI)
            }
        }else if pitch > 14{
            print(seconds)
            customAnim.fadeOut(view: background)
            if !lay{
                for mUI in listCircle{
                    if seconds <= 600 {
                        seconds = 0
                        customAnim.fadeIn(view: mUI)
                        customAnim.springMovement(view: mUI)
                    }
                }
                lay = true
            }
            
        }
    }
    @objc func updateTimer() {
        if seconds <= 600{
            customAnim.fadeOut(view: listCircle[seconds])
            seconds += 1
        }
        
    }
    
    func createBuble(){
        let randomX = Int.random(in: 1...400)
        let randomY = Int.random(in: 1...1000)
        let myNewView=UIView(frame: CGRect(x: randomX, y: randomY, width: 30, height: 30))
        // Change UIView background colour
        customAnim.changeColor(view: myNewView)
        // Add rounded corners to UIView
        myNewView.layer.cornerRadius=myNewView.frame.size.width/2
        myNewView.clipsToBounds = true
        
        // Add UIView as a Subview
        self.listCircle.append(myNewView)
    }
    
    @IBAction func btnBack(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
}
