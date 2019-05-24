//
//  LeafViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 16/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import AVFoundation

class LeafViewController: UIViewController {

    @IBOutlet weak var backgroundShake: UIView!
    
    var leafSound: AVAudioPlayer?
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        
//        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(LeafViewController.back(_:)))
//        screenEdgeRecognizer.edges = .left
//        view.addGestureRecognizer(screenEdgeRecognizer)
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            print("Swipe Left")
            playSound()
            leafDown()
        }
        
        if (sender.direction == .right) {
            print("Swipe Right")
            playSound()
            leafDown()
        }
        
        if (sender.direction == .up) {
            print("Swipe Up")
            playSound()
            leafDown()
        }
        
        if (sender.direction == .down) {
            print("Swipe Down")
            playSound()
            leafDown()
        }
    }
    
    func leafDown(){
        let emitter = Emitter.get(with: UIImage(named: "Leaf-1.png")!)
        emitter.position = CGPoint(x: view.frame.width / 2, y: 50)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
    }
    
    func playSound(){
        let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            leafSound = try AVAudioPlayer(contentsOf: url)
            leafSound?.numberOfLoops = 3
            leafSound?.play()
        } catch {
            print("Couldn't load file ☹️")// couldn't load file :(
        }
    }
    
//    override func becomeFirstResponder() -> Bool {
//        return true
//    }
//
//    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if motion == .motionShake{
//            let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
//            let url = URL(fileURLWithPath: path)
//
//            do {
//                forestSound = try AVAudioPlayer(contentsOf: url)
//                forestSound?.play()
//            } catch {
//                print("Couldn't load file ☹️")// couldn't load file :(
//            }
//        }
//    }
    
    
//    @IBAction func back(_ sender: UIScreenEdgePanGestureRecognizer) {
//        if sender.state == .ended{
//            dismiss(animated: true, completion: nil)
//        }
//    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
