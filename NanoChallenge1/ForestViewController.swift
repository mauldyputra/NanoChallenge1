//
//  ForestViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 20/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import AVFoundation

class ForestViewController: UIViewController {

    var forestSound: AVAudioPlayer?
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            let path = Bundle.main.path(forResource: "Forest Sound.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                forestSound = try AVAudioPlayer(contentsOf: url)
                forestSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
        }
    }
    
    
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
