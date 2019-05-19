//
//  waterViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 16/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import AVFoundation

class waterViewController: UIViewController {
    
    var waterSound: AVAudioPlayer?
    @IBOutlet weak var backgorundWater: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        backgorundWater.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        //        guard sender.view != nil else {return}
        
        if sender.state == .ended{
            let path = Bundle.main.path(forResource: "Water Drop.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                waterSound = try AVAudioPlayer(contentsOf: url)
                waterSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
            animateImage()
        }
    }
    
    func addRippleEffect(to referenceView: UIView) {
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height))
        let shapePosition = CGPoint(x: referenceView.bounds.size.width / 2.0, y: referenceView.bounds.size.height / 2.0)
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        let animation = CAAnimationGroup()
        
        
        let rippleShape = CAShapeLayer()
        
        rippleShape.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
        rippleShape.path = path.cgPath
        rippleShape.fillColor = UIColor.clear.cgColor
        rippleShape.strokeColor = UIColor.white.cgColor
        rippleShape.lineWidth = 4
        rippleShape.position = shapePosition
        rippleShape.opacity = 0
        
        referenceView.layer.addSublayer(rippleShape)
        
        scaleAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
        
        opacityAnim.fromValue = 1
        opacityAnim.toValue = nil
        
        animation.animations = [scaleAnim, opacityAnim]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = CFTimeInterval(0.7)
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = true
        
        rippleShape.add(animation, forKey: "rippleEffect")
    }
    
    func animateImage(){
        addRippleEffect(to: backgorundWater)
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
