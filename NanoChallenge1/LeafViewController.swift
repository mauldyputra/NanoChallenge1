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
    
    var forestSound: AVAudioPlayer?
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
            let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                forestSound = try AVAudioPlayer(contentsOf: url)
                forestSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
        }
        
        if (sender.direction == .right) {
            print("Swipe Right")
            let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                forestSound = try AVAudioPlayer(contentsOf: url)
                forestSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
        }
        
        if (sender.direction == .up) {
            print("Swipe Up")
            let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                forestSound = try AVAudioPlayer(contentsOf: url)
                forestSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
        }
        
        if (sender.direction == .down) {
            print("Swipe Down")
            let path = Bundle.main.path(forResource: "Leaf Crunch.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                forestSound = try AVAudioPlayer(contentsOf: url)
                forestSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
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
