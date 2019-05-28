//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 15/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func waterPressed(_ sender: Any) {
        performSegue(withIdentifier: "waterPage", sender: self)
    }
    @IBAction func leafPressed(_ sender: Any) {
        performSegue(withIdentifier: "leafPage", sender: self)
    }
    
    @IBAction func rainPressed(_ sender: Any) {
        performSegue(withIdentifier: "rainPage", sender: self)
    }
    
    @IBAction func beachPressed(_ sender: Any) {
        performSegue(withIdentifier: "beachPage", sender: self)
    }
    
    
    @IBAction func forestPressed(_ sender: Any) {
        performSegue(withIdentifier: "forestPage", sender: self)
    }
}

