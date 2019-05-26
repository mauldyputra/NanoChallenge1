//
//  waterViewController.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 16/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class waterViewController: UIViewController {
    
    var waterSound: AVAudioPlayer?
    @IBOutlet weak var backgorundWater: UIView!
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    let circle = UIView(frame: CGRect(x: 100, y: 250, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(RainViewController.back(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
//        view.addGestureRecognizer(tap)
        tap.delegate = self as? UIGestureRecognizerDelegate
        circle.alpha = 0
        circle.layer.cornerRadius = 50
        circle.backgroundColor = .white
        view.addSubview(circle)
        view.addGestureRecognizer(tap)
    }
    
    func fadeOut(view: UIView){
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
        view.alpha = 1
        UIView.animate(withDuration: Double.random(in: 0...1.5), animations: {
            //scale 5x
            view.transform = CGAffineTransform(scaleX: 5, y: 5)
            // transparant
            view.alpha = 0
        }) { (isFinished) in
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        //        guard sender.view != nil else {return}
        let touchPoint = sender.location(in: self.view)
        let myX = touchPoint.x
        let myY = touchPoint.y
        circle.center = CGPoint(x: myX, y: myY)
        fadeOut(view: circle)
        if sender.state == .ended{
            let path = Bundle.main.path(forResource: "Water Drop.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                waterSound = try AVAudioPlayer(contentsOf: url)
                waterSound?.play()
            } catch {
                print("Couldn't load file ☹️")// couldn't load file :(
            }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            animateImage()
        }
    }
    
    @IBAction func back(_ sender: UIScreenEdgePanGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    func addRippleEffect(to referenceView: UIView) {
//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height))
//        let shapePosition = CGPoint(x: referenceView.bounds.size.width / 2.0, y: referenceView.bounds.size.height / 2.0)
//        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
//        let opacityAnim = CABasicAnimation(keyPath: "opacity")
//        let animation = CAAnimationGroup()
//        
//        
//        let rippleShape = CAShapeLayer()
//        
//        rippleShape.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
//        rippleShape.path = path.cgPath
//        rippleShape.fillColor = UIColor.clear.cgColor
//        rippleShape.strokeColor = UIColor.white.cgColor
//        rippleShape.lineWidth = 4
//        rippleShape.position = shapePosition
//        rippleShape.opacity = 0
//        
//        referenceView.layer.addSublayer(rippleShape)
//        
//        scaleAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
//        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
//        
//        opacityAnim.fromValue = 1
//        opacityAnim.toValue = nil
//        
//        animation.animations = [scaleAnim, opacityAnim]
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
//        animation.duration = CFTimeInterval(0.7)
//        animation.repeatCount = 1
//        animation.isRemovedOnCompletion = true
//        
//        rippleShape.add(animation, forKey: "rippleEffect")
//    }
    
//    func animateImage(){
//        addRippleEffect(to: backgorundWater)
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
