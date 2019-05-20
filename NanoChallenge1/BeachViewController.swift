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

class BeachViewController: UIViewController {

    var beachSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Sea Waves.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            beachSound = try AVAudioPlayer(contentsOf: url)
            beachSound?.play()
        } catch {
            print("Couldn't load file ☹️")// couldn't load file :(
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
