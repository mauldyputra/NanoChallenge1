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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
